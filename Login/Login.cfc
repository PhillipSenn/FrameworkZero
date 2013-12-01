component {

function Where() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT *
	FROM UsrView
	WHERE UsrID <> 0
	ORDER BY UsrID
	";
	include "/Inc/execute.cfm";
	return local.result;
}

remote function Save(UsrID) {
	session.Usr = new com.Usr().Read(arguments.UsrID);
}

remote function UsrIDPassword() returnformat="json" {
	param url.queryformat="column";
	include "/Inc/newQuery.cfm";
	local.sql = "
	DECLARE @UsrID Int = #Val(arguments.UsrID)#;
	SELECT *
	FROM UsrView
	WHERE UsrID = @UsrID
	AND UsrPass = ?
	";
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(arguments.Password,4));
	include "/Inc/execute.cfm";
	return local.result;
}

}