component {
Variables.MetaData = GetMetaData();

function Top1000() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1000 *
	FROM LogDBView
	ORDER BY LogDBDateTime DESC
	";
	include "/Inc/execute.cfm";
	return local.result;
}

}
