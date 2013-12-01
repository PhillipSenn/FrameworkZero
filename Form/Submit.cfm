<cfscript>
if (StructKeyExists(form,"Save")) {
	new Post().Save(form);
	location('Post.cfm',false);
}
request.js = false;
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<form method="post">
	<label for="UsrName">User Name:</label>
	<input name="UsrName">
	<p>
	<button type="submit" name="Save">Save</button>
	</p>
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>