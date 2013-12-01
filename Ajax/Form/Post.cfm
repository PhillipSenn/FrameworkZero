<cfscript>
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<form>
	<label for="UsrSort">User Sort:</label>
	<input type="number" id="UsrSort" autofocus>
	<p>
	<button type="button" id="Save">Save</button>
	</p>
</form>
<a href="Post.Save.cfm">Diagnostic</a>
<cfinclude template="/Inc/foot.cfm">
<script src="Post.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>