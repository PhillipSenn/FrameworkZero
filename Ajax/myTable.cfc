component {

remote function Save(myTableIDs) returnformat="plain" {
	local.svc = new storedproc();
	local.svc.setDatasource("iSwatchDogDev");
	local.svc.setProcedure("SaveMyTable"); 
	local.svc.addParam(cfsqltype="cf_sql_varchar",type= "in",value='#arguments.myTableIDs#');
	local.svc.addParam(cfsqltype="cf_sql_varchar",type="out",variable="result");
	// local.svc.addProcResult(name="ResultSet1",resultset=1);
	local.obj = local.svc.execute();
	local.result = local.obj.getprocOutVariables().result;
	// local.qry = local.obj.getProcResultSets().ResultSet1;
	return local.result;
}
}