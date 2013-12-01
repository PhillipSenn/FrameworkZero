component {
Variables.MetaData = GetMetaData();

function Top1000() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1000 *
	FROM LogCFErrView
	ORDER BY LogCFErrDateTime DESC
	";
	include "/Inc/execute.cfm";
	return local.result;
}

}
