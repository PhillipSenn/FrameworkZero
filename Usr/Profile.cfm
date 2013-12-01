<cfscript>

</cfscript>

<cfoutput query="session.Usr.qry">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<form method="post">
	<label for="UsrName">Name:</label>
	<input name="UsrName" value="#UsrName#" autofocus>
	<p>
		<button type="reset" name="Save">Save</button>
		<button type="submit" name="Delete" title="Delete this user?">Delete</button>
	</p>
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>