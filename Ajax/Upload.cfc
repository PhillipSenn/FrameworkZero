component {

function TruncateTable() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	TRUNCATE TABLE myTable
	";
	local.svc.setDataSource("iSwatchDogDev");
	include "/Inc/execute.cfm";
}
}