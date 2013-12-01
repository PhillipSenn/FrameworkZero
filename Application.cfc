component {
this.Name = "FrameworkZero";
this.Datasource = "FrameworkZero";
this.SessionManagement = true;
this.ScriptProtect = "all";
this.CurrentTemplatePath = getCurrentTemplatePath();
this.CurrentTemplateDir  = GetDirectoryFromPath(this.CurrentTemplatePath);
this.mappings["/Inc"] = this.CurrentTemplateDir & "Inc";
this.mappings["/com"] = this.CurrentTemplateDir & "com";

// Normally, the following line would not be here:
this.mappings["/Library"] = this.CurrentTemplateDir & "Library"; 
// But for this 1 project, we're moving /Library down into the project itself so that I can experiment with the source code and not break every site that uses the real /Library.
this.ApplicationStarted = false;

public boolean function onApplicationStart() {
	if (!this.ApplicationStarted) {
		if (!StructKeyExists(Application,"fw0")) {
			Application.fw0 = {};
			Application.fw0.Name = "Framework Zero";
			Application.fw0.Dir = "/FrameworkZero/";
			Application.fw0.LogCFID = 0; 		// Todo: SELECT TOP 1 LogCFID FROM LogCF ORDER BY LogCFDateTime DESC
			Application.fw0.LogCFCID = 0; 	// Todo: SELECT TOP 1 LogCFCID FROM LogCFC ORDER BY LogCFCDateTime DESC
			Application.fw0.LogCFErrID = 0;	// Todo: SELECT TOP 1 LogCFErrID FROM LogCFErr ORDER BY LogCFErrDateTime DESC
			Application.fw0.LogDBID = 0; 		// Todo: SELECT TOP 1 LogDBID FROM LogDB ORDER BY LogDBDateTime DESC
			Application.fw0.LogDBErrID = 0; 	// Todo: SELECT TOP 1 LogDBErrID FROM LogDBErr ORDER BY LogDBErrDateTime DESC
			Application.fw0.LogJSID = 0; 		// Todo: SELECT TOP 1 LogJSID FROM LogJS ORDER BY LogJSDateTime DESC
			Application.fw0.LogUIID = 0; 		// Todo: SELECT TOP 1 LogJSID FROM LogJS ORDER BY LogJSDateTime DESC
		}
	
		local.LogCFCName = 'onApplicationStart';
		local.LogCFCDesc = this.Name;
		new com.LogCFC().Save(local);
	
		// Application.LogDB = new com.LogDB(); //Inc/execute.cfm
		this.ApplicationStarted = true;
	}
	return true;
}

public void function onSessionStart() {
	local.LogCFCName = 'onSessionStart';
	local.LogCFCDesc = this.Name;
	new com.LogCFC().Save(local);

	session.fw0 = {};
	session.fw0.LogCFErr = true;  // Are we logging ColdFusion errors?
	session.fw0.LogCFErrCounter = 0;	// See onRequestStart
	session.fw0.LogDB = true;  // Are we logging database calls?
	session.fw0.LogDBCounter = 0; // The number of database calls we have logged for this session.
	session.fw0.LogDBMax = 1000;
	session.fw0.LogDBErr = true; // If we are catching database errors, then
	session.fw0.LogDBErrCounter = 0; // How many database errors do we log for this session? See onRequestStart.

	session.fw0.LogJS = true; // Are we logging JavaScript functions?
	session.fw0.LogUI = true; // Are we logging user interactions?
	session.fw0.Diagnostics = 'Insert,Update,Delete,Select';
}

public boolean function onRequestStart(String targetPage) { // .cfm and .cfc
	local.Developing = false;

	if (StructKeyExists(url,"reset") && UCase(url.reset) == UCase(this.Name)) {
		StructDelete(Application,"fw0");
		onApplicationStart();
		onSessionStart();
	} else if (local.Developing) {
		onApplicationStart();
	}

	if (IsDefined("session.fw0.LogCFErrCounter") && session.fw0.LogCFErrCounter > 200) {
		include "/Inc/onError.cfm";
		abort;
	}
	
	if (IsDefined("session.fw0.LogDBErrCounter") && session.fw0.LogDBErrCounter > 200) {
		include "/Inc/LogDBErr.cfm";
		abort;
	}

	request.fw0 = {};
	request.fw0.TickCount = GetTickCount();
	request.fw0.LogDBSort = 0; // This is a counter
	local.LogCFCName = 'onRequestStart';
	local.LogCFCDesc = targetPage;
	new com.LogCFC().Save(local);

	request.fw0.LogJS = true;
	request.fw0.LogUI = true;
	request.cache = 'cache=' & DateTimeFormat(Now(),"yyyymmddhhnnsslll");
	request.Bootstrap = {};
	request.Bootstrap.Container = true;
	request.Bootstrap.navbar = "navbar-fixed-top"; // none | navbar-fixed-top | navbar-fixed-bottom | navbar-static-top | ""
	request.msg = "";
	StructAppend(form,url,false);

	return true;
}
/*
public void function onError(Exception,EventName) {
	if (!session.fw0.LogCFErr) {
		rethrow();
	}
	session.fw0.LogCFErrCounter += 1; // See onRequestStart

	param request.fw0.LogDBSort = 0; // I use the same counter for LogDB, LogDBErr, LogCF, LogCFErr, LogCFC
	request.fw0.LogDBSort += 1;

	if (IsDefined("arguments.Exception.Message")) {
		WriteOutput("<p>It looks like you got the following ColdFusion error:</p><pre>"
			& Exception.Message
			& "</pre>"
		);
		local.LogCFErrMessage = Exception.Message;
	} else {
		local.LogCFErrMessage = "No Exception.Message";
	}

	if (isDefined("arguments.Exception.Number")) {
		local.LogCFErrNumber = Exception.Number;
	} else {
		local.LogCFErrNumber = "No Exception.Number";
	}
	if (isDefined("arguments.Exception.TagContext") && IsArray(Exception.TagContext) && ArrayLen(Exception.TagContext)) {
		local.LogCFErrLine = Exception.TagContext[1].Line;
	} else {
		local.LogCFErrLine = 0;
	}

	if (isDefined("arguments.Exception.Name")) {
		local.LogCFErrName = Exception.Name;
	} else {
		local.LogCFErrName = "No Exception.Name";
	}
	if (isDefined("arguments.Exception.Detail")) {
		local.LogCFErrDetail = Exception.Detail;
	} else {
		local.LogCFErrDetail = "No Exception.Detail";
	}
	if (isDefined("arguments.Exception.Type")) {
		local.LogCFErrType = Exception.Type;
	} else {
		local.LogCFErrType = "No Exception.Type";
	}
	if (StructKeyExists(arguments,"EventName")) {
		local.LogCFErrEventName = arguments.EventName;
	} else {
		local.LogCFErrEventName = "No arguments.EventName";
	}
	local.LogCFID = new com.LogCF().Save();
	param request.fw0.TickCount = GetTickCount();

	lock scope="application" type="exlusive" timeout="10" {
		Application.fw0.LogCFErrID += 1;
		if (Application.fw0.LogCFErrID > 9999) {
			Application.fw0.LogCFErrID -= 9999;
		}
		local.LogCFErrID = Application.fw0.LogCFErrID;
	}

	local.RemoteAddr = getPageContext().getRequest().getRemoteAddr();
	local.sql = "
	DECLARE @LogCFErrID Int = #Val(local.LogCFErrID)#;
	DECLARE @LogCFID Int = #Val(local.LogCFID)#;
	DECLARE @LogCFErrSort Int = #Val(request.fw0.LogDBSort)#;
	DECLARE @LogCFErrElapsed Int = #GetTickCount() - request.fw0.TickCount#;
	DECLARE @LogCFErrNumber Int = #Val(local.LogCFErrNumber)#;
	DECLARE @LogCFErrLine Int = #Val(local.LogCFErrLine)#;
	
	UPDATE LogCFErr SET
	 LogCFErr_LogCFID = @LogCFID
	,LogCFErrSort = @LogCFErrSort
	,LogCFErrNumber = @LogCFErrNumber
	,LogCFErrElapsed = @LogCFErrElapsed
	,LogCFErrLine = @LogCFErrLine
	,LogCFErrDatetime = getdate()
	,LogCFErrName = ?
	,LogCFErrDetail = ?
	,LogCFErrMessage = ?
	,LogCFErrType = ?
	,LogCFErrEventName = ?
	,LogCFErrRemoteAddr = ?
	WHERE LogCFErrID = @LogCFErrID
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.LogCFErrName,512));
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.LogCFErrDetail,512));
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.LogCFErrMessage,512));
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.LogCFErrType,512));
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.LogCFErrEventName,512));
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.RemoteAddr,15));
	local.svc.execute();

	include "/Passwords/FrameworkZero.cfm";
	local.svc = new mail();
	local.svc.setSubject(Application.fw0.Name & ': ' & ListLast(GetBaseTemplatePath(),'\'));
	local.msg = LogCFErrMessage;
	local.svc.setBody(local.msg);
	
	local.svc.setServer(local.Server);
	local.svc.setType(local.Type);
	local.svc.setUseSSL(local.UseSSL);
	local.svc.setPort(local.Port);
	local.svc.setFrom(local.UserName);
	local.svc.setUserName(local.UserName);
	local.svc.setPassword(local.Password);
	local.svc.setTo(local.UserName);
	local.svc.Send();
	WriteOutput("I've sent an email to the administrator to let them know.");
}
*/
public boolean function onRequest(string targetPage) { // .cfm only
	local.LogCFCName = 'onRequest';
	local.LogCFCDesc = targetPage;
	new com.LogCFC().Save(local);

	if (StructKeyExists(form,"logout")) {
		StructDelete(session,"Usr");
	}
	if (!StructKeyExists(session,"Usr")) {
		include Application.fw0.dir & "Login/Login.cfm";
	} else {
		include arguments.targetPage;
	}
	return true;
}
/*
This is making my ajax call return true!
public boolean function onCFCRequest(string cfc, string method, struct args) { // .cfc only
	// Be careful not to run any new cfc requests from this function.
	local.LogCFCName = 'onCFCRequest';
	local.LogCFCDesc = arguments.cfc & '()' & arguments.method & '(';
	local.i = 0;
	for (arg in args) {
		if (local.i) {
			local.LogCFCDesc &= ',';
		}
		local.i += 1;
		local.LogCFCDesc &= arg & '=' & args[arg];
	}
	local.LogCFCDesc &= ')';
	param request.fw0.TickCount = GetTickCount();
	param request.fw0.LogDBSort = 0; // I use the same counter for LogDB, LogDBErr, LogCF, LogCFErr, LogCFC

	request.fw0.LogDBSort += 1;
	lock scope="application" type="exlusive" timeout="10" {
		Application.fw0.LogCFCID += 1;
		if (Application.fw0.LogCFCID > 9999) {
			Application.fw0.LogCFCID -= 9999;
		}
		local.LogCFCID = Application.fw0.LogCFCID;
	}
	if (IsDefined("session.Usr.qry.UsrID")) {
		local.UsrID = session.Usr.qry.UsrID;
	} else {
		local.UsrID = 0;
	}
	
	local.sql = "
	DECLARE @LogCFCID Int = #Val(local.LogCFCID)#;
	DECLARE @LogDBSort Int = #Val(request.fw0.LogDBSort)#;
	DECLARE @LogCFCElapsed Int = #GetTickCount() - request.fw0.TickCount#;
	DECLARE @UsrID Int = #Val(local.UsrID)#;
	
	UPDATE LogCFC SET
	 LogCFCSort=@LogDBSort
	,LogCFCElapsed=@LogCFCElapsed
	,LogCFC_UsrID =@UsrID
	,LogCFCDateTime = getdate()
	,LogCFCName = ?
	,LogCFCDesc = ?
	WHERE LogCFCID = @LogCFCID;
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogCFCName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogCFCDesc);
	local.svc.execute();


	local.comp = createObject("component", arguments.cfc);
	local.result = Evaluate("local.comp.#arguments.method#(argumentCollection=arguments.args)");
	return true;
}
*/

public void function onRequestEnd(String targetPage) {
	local.LogCFCName = 'onRequestEnd';
	local.LogCFCDesc = targetPage;
	new com.LogCFC().Save(local);
}

public void function onSessionEnd(SessionScope,ApplicationScope){
	local.LogCFCName = 'onSessionEnd';
	local.LogCFCDesc = ''; // SessionScope.Usr.qry.UsrID
	new com.LogCFC().Save(local);
}

public void function onApplicationEnd(ApplicationScope){
	local.LogCFCName = 'onApplicationEnd';
	local.LogCFCDesc = '';
	new com.LogCFC().Save(local);
}

public boolean function onMissingTemplate(String targetPage) {
	local.LogCFCName = 'onMissingTemplate';
	local.LogCFCDesc = targetPage;
	new com.LogCFC().Save(local);
	return true;
}

public void function onMissingMethod(String method,Struct args) {
	local.LogCFCName = 'onMissingMethod';
	local.LogCFCDesc = arguments.method & '(';
	local.i = 0;
	for (arg in args) {
		if (local.i) {
			local.LogCFCDesc &= ',';
		}
		local.i += 1;
		local.LogCFCDesc &= arg & '=' & args[arg];
	}
	local.LogCFCDesc &= ')';
	new com.LogCFC().Save(local);
}
}
