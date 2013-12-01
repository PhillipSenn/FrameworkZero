<!--- 
rtn is the local scope that was passed into funTryCatch as arguments.rtn.
So think of rtn.result.qry as local.result.qry and rtn.result.Prefix as local.result.Prefix 
--->
<cfscript>
local.svc = new mail();
local.svc.setSubject(Application.fw0.Name & ': ' & ListLast(GetBaseTemplatePath(),'\'));
local.msg  = '';
if (StructKeyExists(rtn.result.Exception,"Datasource")) {
	local.msg &= 'Datasource: ' & rtn.result.Exception.datasource & '<br>';
}
if (StructKeyExists(rtn.result.Exception,"Detail")) {
	local.msg &= 'Detail: ' & rtn.result.Exception.Detail & '<br>';
}
if (StructKeyExists(rtn.result.Exception,"Detail")) {
	local.msg &= 'ErrorCode: ' & rtn.result.Exception.ErrorCode & '<br>';
}
if (StructKeyExists(rtn.result.Exception,"Message")) {
	local.msg &= 'Message: ' & rtn.result.Exception.message & '<br>';
}
if (StructKeyExists(rtn.result.Exception,"NativeErrorCode")) {
	local.msg &= 'NativeErrorCode: ' & rtn.result.Exception.NativeErrorCode & '<br>';
}
if (StructKeyExists(rtn.result.Exception,"SQLState")) {
	local.msg &= 'SQLState: ' & rtn.result.Exception.SQLState & '<br>';
}
// local.msg &= 'StackTrace: ' & rtn.result.Exception.StackTrace & '<br>';
if (StructKeyExists(rtn.result.Exception,"Type")) {
	local.msg &= 'Type: ' & rtn.result.Exception.Type & '<br>';
}
if (StructKeyExists(rtn.result.Exception,"QueryError")) {
	local.msg &= 'QueryError: ' & rtn.result.Exception.QueryError & '<br>';
}
if (StructKeyExists(rtn.result.Exception,"Where") && rtn.result.Exception != '') {
	local.msg &= 'Where: ' & rtn.result.Exception.Where & '<br>';
}
local.msg &= '<p>';
local.msg &= 'Application: ' & Application.fw0.Name & '<br>';
local.msg &= 'SCRIPT_NAME: ' & cgi.SCRIPT_NAME & '<br>';
local.msg &= 'CurrentTmpl: ' & GetCurrentTemplatePath() & '<br>';
local.msg &= '</p>';
if (StructKeyExists(rtn.result.Exception,"sql")) {
	local.msg &= '<pre>' & rtn.result.Exception.sql & '</pre>';
} else {
	local.msg &= '<pre>rtn.result.Exception.sql is empty.</pre>';
}
local.svc.setBody(local.msg);
include "/Passwords/FrameworkZero.cfm";
local.svc.setServer(local.Server);
local.svc.setType(local.Type);
local.svc.setUseSSL(local.UseSSL);
local.svc.setPort(local.Port);
local.svc.setFrom(local.UserName);
local.svc.setUserName(local.UserName);
local.svc.setPassword(local.Password);
</cfscript>
