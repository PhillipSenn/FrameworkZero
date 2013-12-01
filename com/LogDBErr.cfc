component extends="Library.fw0.ReadWhereDelete" {
Variables.TableName = "LogDBErr";
Variables.TableSort = "LogDBErrID DESC";
Variables.MetaData = GetMetaData();

function Save(rtn) {
	param request.fw0.TickCount = GetTickCount();
	param request.fw0.LogDBSort = 0; // I use the same counter for LogDB, LogDBErr, LogCF, LogCFErr
	request.fw0.LogDBSort += 1;

	if (IsDefined("rtn.MetaData.FullName")) {
		local.LogDBErrComponentName = rtn.MetaData.FullName;
	} else {
		local.LogDBErrComponentName = "";
	}
	if (StructKeyExists(rtn.result.Exception,"sql")) {
		local.LogDBErrName = rtn.result.Exception.sql;
	} else {
		local.LogDBErrName = "rtn.result.Exception.sql";
	}
	if (StructKeyExists(rtn.result.Exception,"Type")) {
		local.LogDBErrType = rtn.result.Exception.Type;
	} else {
		local.LogDBErrType = "rtn.result.Exception.Type";
	}
	if (StructKeyExists(rtn.result.Exception,"Message")) {
		local.LogDBErrMessage = rtn.result.Exception.Message;
	} else {
		local.LogDBErrMessage = "rtn.result.Exception.Message";
	}
	if (StructKeyExists(rtn.result.Exception,"Detail")) {
		local.LogDBErrDetail = rtn.result.Exception.Detail;
	} else {
		local.LogDBErrDetail = "rtn.result.Exception.Detail";
	}
	if (StructKeyExists(rtn.result.Exception,"NativeErrorCode")) {
		local.LogDBErrCode = rtn.result.Exception.NativeErrorCode;
	} else {
		local.LogDBErrCode = 0;
	}
	if (StructKeyExists(rtn.result.Exception,"SQLState")) {
		local.LogDBErrSQLState = rtn.result.Exception.SQLState;
	} else {
		local.LogDBErrSQLState = 0;
	}

	if (StructKeyExists(rtn.result.Exception,"queryError")) {
		local.LogDBErrQuery = rtn.result.Exception.QueryError;
		if (local.LogDBErrQuery != local.LogDBErrDetail) {
			local.LogDBErrDetail &= '<br>' & local.LogDBErrQuery;
		}
	}
	if (StructKeyExists(rtn.result.Exception,"where")) {
		local.LogDBErrWhere = rtn.result.Exception.where;
	} else {
		local.LogDBErrWhere = "rtn.result.Exception.where";
	}
	lock scope="application" type="exlusive" timeout="10" {
		Application.fw0.LogDBErrID += 1;
		if (Application.fw0.LogDBErrID > 9999) {
			Application.fw0.LogDBErrID -= 9999;
		}
		local.LogDBErrID = Application.fw0.LogDBErrID;
	}
	local.RemoteAddr  = getPageContext().getRequest().getRemoteAddr();

	local.sql = "
	DECLARE @LogDBErrID Int = #Val(local.LogDBErrID)#;
	DECLARE @LogCFID Int = #Val(rtn.LogCFID)#;
	DECLARE @LogDBErrSort Int = #Val(request.fw0.LogDBSort)#;
	DECLARE @LogDBErrElapsed Int = #GetTickCount() - request.fw0.TickCount#;
	DECLARE @LogDBErrCode Int = #Val(local.LogDBErrCode)#;
	DECLARE @LogDBErrSQLState Int = #Val(local.LogDBErrSQLState)#;
	UPDATE LogDBErr SET
	 LogDBErr_LogCFID=@LogCFID
	,LogDBErrSort=@LogDBErrSort
	,LogDBErrElapsed=@LogDBErrElapsed
	,LogDBErrCode=@LogDBErrCode
	,LogDBErrSQLState=@LogDBErrSQLState
	,LogDBErrDateTime = getdate()
	,LogDBErrComponentName=?
	,LogDBErrFunctionName=?
	,LogDBErrName=?
	,LogDBErrType=?
	,LogDBErrMessage=?
	,LogDBErrDetail=?
	,LogDBErrWhere=?
	,LogDBErrRemoteAddr=?
	WHERE LogDBErrID=@LogDBErrID
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBErrComponentName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=rtn.LogDBErrFunctionName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBErrName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBErrType);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBErrMessage);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBErrDetail);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBErrWhere);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(local.RemoteAddr,15));
	local.svc.execute();

	WriteOutput('<html>' & Chr(10));
	WriteOutput('<body>' & Chr(10));
	WriteOutput('It looks like you got the following error:<pre>' & rtn.result.Exception.Detail & '</pre>' & Chr(10));
	include "/Library/fw0/newMail.cfm";
	local.svc.setTo('Administrator<#local.UserName#>');
	local.svc.Send();
	WriteOutput("<p>I've sent an email to the administrator to let them know.</p>" & Chr(10));
	WriteOutput('</body>' & Chr(10));
	WriteOutput('</html>');
	abort;
}
}