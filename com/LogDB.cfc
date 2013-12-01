component extends="Library.fw0.ReadWhereDelete" {
Variables.TableName = "LogDB";
Variables.TableSort = "LogDBID DESC";
Variables.MetaData = GetMetaData();

function Save(rtn) {
	param request.fw0.LogDBSort = 0;
	request.fw0.LogDBSort += 1; // This would show how many times this request has made a database call.
	session.fw0.LogDBCounter += 1; // We could display this to show how many rows would have been logged
	if (session.fw0.LogDBCounter > session.fw0.LogDBMax) {
		return;
	}
	
	param request.fw0.TickCount = GetTickCount();
	if (IsDefined("rtn.Metadata.FullName")) {
		local.LogDBComponentName = rtn.MetaData.FullName;
	} else {
		local.LogDBComponentName = "";
	}

	local.LogDBName = Trim(rtn.result.Prefix.sql); // The sql string that was executed
	local.LogDBName = Replace(local.LogDBName,Chr(9),'','all');
	if (StructKeyExists(rtn.result.Prefix,"sqlparameters")) {
		// Replace ? with the corresponding parameters
		for (local.LogIndex=1; local.LogIndex <= ArrayLen(rtn.result.Prefix.sqlparameters); local.LogIndex++) {
			if (Find('?',local.LogDBName)) {
				local.LogDBName = Replace(local.LogDBName,'?',"'" & rtn.result.Prefix.sqlparameters[local.LogIndex] & "'");
			} else {
				local.LogDBName &= '<span rep="label-danger">' & local.LogIndex & rtn.result.Prefix.sqlparameters[local.LogIndex] & '</span>';
			}
		}
		local.LogDBName = Replace(local.LogDBName,'?','<span rep="label-danger">?</span>','all');
	}

	lock scope="application" type="exlusive" timeout="10" {
		Application.fw0.LogDBID += 1;
		if (Application.fw0.LogDBID > 9999) {
			Application.fw0.LogDBID -= 9999;
		}
		local.LogDBID = Application.fw0.LogDBID;
	}
	if (IsDefined("session.Usr.qry.UsrID")) {
		local.UsrID = session.Usr.qry.UsrID;
	} else {
		local.UsrID = 0;
	}
	local.RemoteAddr = getPageContext().getRequest().getRemoteAddr();
	local.sql = "
	DECLARE @LogDBID Int = #Val(local.LogDBID)#;
	DECLARE @LogDBSort Int = #Val(request.fw0.LogDBSort)#;
	DECLARE @LogDBElapsed Int = #GetTickCount() - request.fw0.TickCount#;
	DECLARE @LogDBRecordCount Int = #Val(rtn.result.Prefix.RecordCount)#;
	DECLARE @LogDBExecutionTime Int = #Val(rtn.result.Prefix.ExecutionTime)#;
	DECLARE @UsrID Int = #Val(local.UsrID)#;
	
	UPDATE LogDB SET
	 LogDBSort=@LogDBSort
	,LogDBElapsed=@LogDBElapsed
	,LogDBRecordcount=@LogDBRecordcount
	,LogDBExecutionTime=@LogDBExecutionTime
	,LogDB_UsrID = @UsrID
	,LogDBDateTime=getdate()
	,LogDBComponentName=?
	,LogDBFunctionName=?
	,LogDBName=?
	,LogDBRemoteAddr = ?
	WHERE LogDBID = @LogDBID
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBComponentName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=rtn.LogDBFunctionName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.RemoteAddr,15));
	local.svc.execute();
}
}
