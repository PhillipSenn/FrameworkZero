window.dbo = openDatabase('iFrameworkZero','1.0','iFrameworkZero', 10000);

(function() {
	var Variables = {};
	
	dbo.transaction(SelectmyTable);
	function SelectmyTable(SQLTransaction) {
		var local = {};
		local.sqlite = "SELECT * FROM myTable ORDER BY myTableID";
		SQLTransaction.executeSql(
			 local.sqlite
			,[]
			,SelectSuccess
			,SelectFailure
		);
	}
	function SelectSuccess(SQLTransaction,SQLResultSet) {
		var local = {};

		local.data = {};
		local.data.myTableIDs = '';
		Variables.Recordcount = SQLResultSet.rows.length;
		for (local.i = 0; local.i < SQLResultSet.rows.length; local.i++) {
			if (local.i) {
				local.data.myTableIDs += ',';
			}
			local.data.myTableIDs += SQLResultSet.rows.item(local.i).myTableID;
		}

		local.dataType = 'text'; // Remember to use this if there is no return value.
		local.data.method = 'Save';
		local.Promise = $.ajax('myTable.cfc',local);
		var UploadDone = UploadDone.bind(this,local.data.myTableIDs);
		local.Promise.done(UploadDone);
		local.Promise.fail(UploadFail);
	};
	function UploadDone(argTableIDs,result,textStatus,jqXHR) {
		var local = {};
		
		if (result === '') {
			local.UpdateMyTable = UpdateMyTable.bind(this,argTableIDs);
			dbo.transaction(local.UpdateMyTable);
		} else {
			debugger;
		}
	}
	function UpdateMyTable(argTableIDs,SQLTransaction) {
		var local = {};

		local.arr = argTableIDs.split(',');
		local.myDate = yyyymmddhhnnssl();
		for (local.i=0; local.i < local.arr.length; local.i++) {
			local.UpdateSuccess = UpdateSuccess.bind(this,local.i);
			local.sqlite = "UPDATE myTable SET SyncDateTime=? WHERE myTableID=?";
			SQLTransaction.executeSql(
				 local.sqlite
				,[
				 local.myDate
				,local.arr[local.i]
				]
				,local.UpdateSuccess
				,UpdateFailure
			);
		}
	}
	function UpdateSuccess(argCounter,A,B,C) {
		if (argCounter+1 === Variables.Recordcount) {
			alert('done!');
		}
	}
	function SelectFailure(A,B,C) {
		debugger;
	};
	function UploadFail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
	function UpdateFailure(A,B,C) {
		debugger;
	}
})();