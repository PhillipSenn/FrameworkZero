component {

function Top1000() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1000 *
	FROM LogDBErrView
	ORDER BY LogDBErrDateTime DESC
	";
	include "/Inc/execute.cfm";
	return local.result;
}

}
