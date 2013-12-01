window.dbo = openDatabase('iFrameworkZero','1.0','iFrameworkZero', 10000);

(function() {
	var Variables = {};
	Variables.Recordcount = 500;
	
	dbo.transaction(DropTable);
	function DropTable(SQLTransaction) {
		var local = {};
		local.sqlite = "DROP TABLE IF EXISTS myTable";
		SQLTransaction.executeSql(
			 local.sqlite
			,[]
			,DropTableSuccess
			,DropTableFailure
		);
	}
	function DropTableSuccess() {
		dbo.transaction(CreateTable);
	}
	function DropTableFailure() {
		debugger;
	}
	
	function CreateTable(SQLTransaction) {
		var local = {};
		local.sqlite = "CREATE TABLE IF NOT EXISTS myTable"
			+ "(myTableID Integer NOT NULL PRIMARY KEY AUTOINCREMENT"
			+ ",SyncDateTime Varchar(128)"
			+ ");"
		SQLTransaction.executeSql(
			 local.sqlite
			,[]
			,CreateTableSuccess
			,CreateTableFailure
		);
	}
	
	function CreateTableSuccess() {
		dbo.transaction(myTableTransaction);
	}
	function CreateTableFailure() {
		debugger;
	}
	
	function myTableTransaction(SQLTransaction) {
		var local = {};
		
		for (local.i=0; local.i < Variables.Recordcount; local.i++) {
			local.InsertSuccess = InsertSuccess.bind(this,local.i);
			local.sqlite = "INSERT INTO myTable(SyncDateTime) VALUES('')"
			SQLTransaction.executeSql(
			 local.sqlite
			,[]
			,local.InsertSuccess
			,InsertFailure
			);
		}
	}
	function InsertSuccess(argCurrentRow,SQLTransaction,SQLResultSet) {
		if (argCurrentRow+1 === Variables.Recordcount) {
			alert('Done!');
		}
	}
	function InsertFailure(A,B,C) {
		debugger;
	}
})();
