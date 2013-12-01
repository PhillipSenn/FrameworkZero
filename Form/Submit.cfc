component {

remote function Save(form) {
	include "/Inc/newQuery.cfm";
	local.sql = "
	DECLARE @UsrID Int = #Val(session.Usr.qry.UsrID)#;
	UPDATE Usr SET
	 UsrName = ?
	WHERE UsrID=@UsrID
	";
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(form.UsrName,128));
	include "/Inc/execute.cfm";
}
}
