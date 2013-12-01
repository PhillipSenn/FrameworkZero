component {

function Diagnostic(form) {
	local.result = {};
	local.sql = "
	SELECT TOP 1 *
	FROM INFORMATION_SCHEMA.TABLES
	ORDER BY TABLE_TYPE,TABLE_SCHEMA,TABLE_NAME
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	try {
		local.obj = local.svc.execute();
		local.result.Class  = "btn-success";
		local.result.Status = "Yes";
	} catch(any Exception) {
		local.result.Class  = "btn-danger";
		local.result.Status = "NO";
	}
	return local.result;
}
}
