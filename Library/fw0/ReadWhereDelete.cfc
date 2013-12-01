component {
Variables.MetaData = GetMetaData();

function Read(form) {
	if (IsSimpleValue(form)) {
		local.PrimaryKey = form; // They passed in an id
	} else {
		local.PrimaryKey = form["#Variables.TableName#ID"]; // They passed in form.id
	}
	include '/Inc/newQuery.cfm';
	local.sql = "SELECT * FROM " 
		& Variables.TableName
		& "View WHERE " 
		& Variables.TableName 
		& "ID=" 
		& Val(local.PrimaryKey);
	include '/Inc/execute.cfm';
	return local.result;
}

function Where(form,FieldValue,OrderBy) {
	//    Usage: 
	// a. obj = new com.Usr().Where("Something",1,"UsrSort DESC");
	//    or
	// b. form.FieldName = "Something";
	//    form.FieldValue = 1;
	//    form.OrderBy = "UsrSort DESC";
	//    obj = new com.Usr().Where(form);
	
	include '/Inc/newQuery.cfm';
	if (StructKeyExists(arguments,"form")) {
		if (IsSimpleValue(form)) { // Example a
			local.sql = 'SELECT * FROM ' & Variables.TableName & 'View WHERE ' & arguments.form & ' = ' & Val(arguments.FieldValue);
		} else { // 1 parameter: form.FieldName, form.FieldValue and form.OrderBy (Example b)
			local.sql = 'SELECT * FROM ' & Variables.TableName & 'View WHERE ' & form.FieldName & ' = ' & Val(form.FieldValue);
		}
	} else { // 0 parameters
		local.sql = 'SELECT * FROM ' & Variables.TableName & 'View';
	}
	if (StructKeyExists(arguments,'OrderBy')) { // 3 parameters (Example a)
		local.sql &= ' ORDER BY ' & arguments.OrderBy;
	} else if (IsDefined("arguments.form.OrderBy")) { // 1 parameter: form.FieldName, form.FieldValue and form.OrderBy (Example b)
		local.sql &= ' ORDER BY ' & arguments.form.OrderBy;
	} else { // 0 parameters or 2 parameters (Example a)
		local.sql &= ' ORDER BY ' & Variables.TableSort;
	}
	include '/Inc/execute.cfm';
	return local.result;
}

function Delete(form) {
	include '/Inc/newQuery.cfm';
	local.PrimaryKey = form["#Variables.TableName#ID"];
	local.sql = "DELETE FROM "
		& Variables.TableName
		& " WHERE "
		& Variables.TableName
		& "ID="
		& Val(local.PrimaryKey);	
	include '/Inc/execute.cfm';
	return local.result;
}
}