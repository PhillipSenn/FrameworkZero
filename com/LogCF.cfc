component extends="Library.fw0.ReadWhereDelete" {
Variables.TableName = "LogCF";
Variables.TableSort = "LogCFID DESC";
Variables.MetaData = GetMetaData();

function Save() {
	param request.fw0.TickCount = GetTickCount();
	param request.fw0.LogDBSort = 0; // I use the same counter for LogDB, LogDBErr, LogCF, LogCFErr

	request.fw0.LogDBSort += 1;
	local.LogCFOutString   = getPageContext().getOut().getString();
	local.LogCFQueryString = cgi.QUERY_STRING; // getPageContext().getRequest().getQueryString();
	local.RemoteAddr  = getPageContext().getRequest().getRemoteAddr();
	local.LogCFName  = getPageContext().getRequest().getServletPath();
	if (Left(local.LogCFName,Len(Application.fw0.dir)) == Application.fw0.dir) {
		local.LogCFName = Mid(local.LogCFName,Len(Application.fw0.dir),128);
	}
	local.LogCFCookies     = getPageContext().getRequest().getHeader("Cookie");
	local.LogCFUserAgent   = getPageContext().getRequest().getHeader("User-Agent");
	savecontent variable="local.LogCFURL" { 
		writedump(var=url,format="text",top=3,metainfo=false);
	}
	if (Find('struct [empty]',local.LogCFURL)) {
		local.LogCFURL = '';
	}
	savecontent variable="local.LogCFForm" { 
		writedump(var=form,format="text",top=3,metainfo=false);
	}
	if (Find('struct [empty]',local.LogCFForm)) {
		local.LogCFForm = '';
	}

	savecontent variable="local.LogCFSession" { 
		writedump(var=session,format="text",top=3,metainfo=false);
	}
	lock scope="application" type="exlusive" timeout="10" {
		Application.fw0.LogCFID += 1;
		if (Application.fw0.LogCFID > 9999) {
			Application.fw0.LogCFID -= 9999;
		}
		local.LogCFID = Application.fw0.LogCFID;
	}
	if (IsDefined("session.Usr.qry.UsrID")) {
		local.UsrID = session.Usr.qry.UsrID;
	} else {
		local.UsrID = 0;
	}
	
	local.sql = "
	DECLARE @LogCFID Int = #Val(local.LogCFID)#;
	DECLARE @LogCFSort Int = #Val(request.fw0.LogDBSort)#;
	DECLARE @LogCFElapsed Int = #GetTickCount() - request.fw0.TickCount#;
	DECLARE @UsrID Int = #Val(local.UsrID)#;
	
	UPDATE LogCF SET
	 LogCFSort=@LogCFSort
	,LogCFElapsed=@LogCFElapsed
	,LogCF_UsrID =@UsrID
	,LogCFDateTime = getdate()
	,LogCFOutString=?
	,LogCFQueryString=?
	,LogCFName=?
	,LogCFCookies=?
	,LogCFUserAgent=?
	,LogCFURL=?
	,LogCFForm=?
	,LogCFSession=?
	,LogCFRemoteAddr=?
	WHERE LogCFID = @LogCFID;
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogCFOutString);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.LogCFQueryString,512));
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.LogCFName,512));
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogCFCookies);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.LogCFUserAgent,512));
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogCFURL);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogCFForm);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogCFSession);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.RemoteAddr,15));
	local.obj = local.svc.execute();
	local.result.qry = local.obj.getResult();
	local.result.Prefix = local.obj.getPrefix();
	return local.LogCFID;
}
}
