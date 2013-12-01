component {

remote function Read() returnformat="plain" { 
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT getdate() AS PingDate
	";
	include "/Inc/execute.cfm";
	return local.result.qry.PingDate; // 23 bytes - no big deal.
}
}
