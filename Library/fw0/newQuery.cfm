<cfscript>
local.result = {};
local.result.msg = "";
local.svc = new query();
if (StructKeyExists(Variables,"DataSource")) {
	local.svc.setDataSource(Variables.DataSource);
}
if (IsDefined("session.fw0.LogDB") && session.fw0.LogDB) { // Do we log this database call?
	local.fw0.LogDB = session.fw0.LogDB;
	local.LogDBFunctionName = GetFunctionCalledName();
} else {
	local.fw0.LogDB = false;
}
if (IsDefined("session.fw0.LogDBErr")) { // Do we catch errors with this database call?
	local.fw0.LogDBErr = session.fw0.LogDBErr;
	local.LogDBErrFunctionName = GetFunctionCalledName();
} else {
	local.fw0.LogDBErr = false;
}
</cfscript>