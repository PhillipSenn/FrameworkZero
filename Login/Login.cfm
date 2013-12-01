<cfscript>
Usr = new FrameworkZero.Login.Login().Where();
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>This would normally be a login screen:</h1>
<div>
	<label for="UsrID">Which User do you want to be?</label>
	<select id="UsrID">
		<option value="0">Please Select</option>
		<cfloop query="Usr.qry">
			<option value="#UsrID#">#UsrName#</option>
		</cfloop>
	</select>
</div>
<div hidden>
	<label for="Password">Password:</label>
	<input id="Password">
</div>
<cfinclude template="/Inc/foot.cfm">
<script src="#Application.fw0.dir#Login/Login.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>