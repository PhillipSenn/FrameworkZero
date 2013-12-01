component extends="Library.fw0.ReadWhereDelete" {
Variables.TableName = "LogCFC";
Variables.TableSort = "LogCFCID DESC";
Variables.MetaData = GetMetaData();

function Save(form) {
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
	local.RemoteAddr = getPageContext().getRequest().getRemoteAddr();
	
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
	,LogCFCRemoteAddr = ?
	WHERE LogCFCID = @LogCFCID;
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=form.LogCFCName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=form.LogCFCDesc);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.RemoteAddr,15));
	local.svc.execute();
	// local.result.qry = local.obj.getResult();
	// local.result.Prefix = local.obj.getPrefix();
}
}
