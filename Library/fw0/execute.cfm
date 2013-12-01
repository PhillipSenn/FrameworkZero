<cfscript>
if (StructKeyExists(Variables,"Metadata")) {
	local.Metadata = Variables.Metadata;
}

local.svc.setSQL(local.sql);
if (local.fw0.LogDBErr) { // If we are catching errors
	try {
		local.obj = local.svc.execute();
		local.result.qry = local.obj.getResult();
		local.result.Prefix = local.obj.getPrefix();
	} catch(any Exception) {
		session.fw0.LogDBErrCounter += 1; // See onRequestStart
		local.result.Exception = Exception;
		local.LogCFID = new com.LogCF().Save();
		new com.LogDBErr().Save(local);
	}
} else {
	local.obj = local.svc.execute();
	local.result.qry = local.obj.getResult();
	local.result.Prefix = local.obj.getPrefix();
}
if (local.fw0.LogDB) { // If we are logging this database call
	if (IsDefined("local.result.Prefix")) {
		new com.LogDB().Save(local);
	}
}
</cfscript>
