component {
param url.queryformat="column";

remote function Save(UsrSort) returnformat="json" {
	include "/Inc/newQuery.cfm";
	local.sql = "
	DECLARE @UsrID Int = #Val(session.Usr.qry.UsrID)#;
	DECLARE @UsrSort Int = #Val(arguments.UsrSort)#;
	UPDATE Usr SET
	UsrSort = @UsrSort
	WHERE UsrID = @UsrID;
	SELECT *
	FROM Usr
	WHERE UsrID = @UsrID;
	";
	include "/Inc/execute.cfm";
	return local.result;
}
}
