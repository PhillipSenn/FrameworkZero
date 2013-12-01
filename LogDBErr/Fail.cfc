component {
Variables.MetaData = GetMetaData();

function TableNotFound() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT *
	FROM xxx
	";
 	include "/Inc/execute.cfm";
	return local.result;
}
}
