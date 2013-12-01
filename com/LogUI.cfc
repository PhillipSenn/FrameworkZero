component extends="Library.fw0.ReadWhereDelete" {
Variables.TableName = "LogUI";
Variables.TableSort = "LogUIID DESC";
Variables.MetaData = GetMetaData();

remote function Save() {
	if (!session.fw0.LogUI) return;
	local.LogUIName = ReplaceNoCase(cgi.HTTP_REFERER,'http://www.phillipsenn.com','');
	if (Left(local.LogUIName,Len(Application.fw0.dir)) == Application.fw0.dir) {
		local.LogUIName = Mid(local.LogUIName,Len(Application.fw0.dir),128);
	}
	
	if (Len(arguments.LogUIClass)) {
		local.LogUIClass = '.' & Replace(arguments.LogUIClass,' ','.','all');
	} else {
		local.LogUIClass = '';
	}
	lock scope="application" type="exlusive" timeout="10" {
		Application.fw0.LogUIID += 1;
		if (Application.fw0.LogUIID > 9999) {
			Application.fw0.LogUIID -= 9999;
		}
		local.LogUIID = Application.fw0.LogUIID;
	}

	local.RemoteAddr = getPageContext().getRequest().getRemoteAddr();
	local.sql = "
	DECLARE @LogUIID Int = #Val(local.LogUIID)#;
	DECLARE @LogJSSort Int = #Val(arguments.LogJSSort)#;
	DECLARE @LogUIElapsed Int = #GetTickCount() - arguments.TickCount#;
	DECLARE @UsrID Int = #Val(arguments.UsrID)#;
	UPDATE LogUI SET
	 LogUISort=@LogJSSort
	,LogUIElapsed=@LogUIElapsed
	,LogUI_UsrID = @UsrID
	,LogUIDateTime = getdate()
	,LogUIName=?
	,LogUITag=?
	,LogUITagName=?
	,LogUIIdentifier=?
	,LogUIClass=?
	,LogUIDestination=?
	,LogUIValue=?
	,LogUIRemoteAddr = ?
	WHERE LogUIID = @LogUIID
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogUIName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=arguments.LogUITag,MaxLength=6); // anchor, button, check
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=arguments.LogUITagName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=arguments.LogUIIdentifier);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogUIClass);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=arguments.LogUIDestination);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=arguments.LogUIValue);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.RemoteAddr,15));
	local.svc.execute();
	// Don't forget to put local.dataType = 'text'; in the JavaScript!
}
}
