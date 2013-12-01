<cfscript>
if (StructKeyExists(form,"UserName")) {
	WriteOutput('Hey, wait a minute...');
	WriteOutput("<p>I don't think I want to send an email to " & form.UserName & '!</p>');
	abort;
}
param form.Username = local.UserName;
result = new cfMail().Send(form);
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>Is cfMail working?</h1>
<a href="Diagnostics.cfm" class="#result.Class#">#result.Status#</a>
<!---<p>An email was sent from #local.UserName# to #form.UserName#.</p>--->
<p>
Normally, this program would send an email, but since it's on the public facing website, I've turned that feature off.
</p>
<form method="post">
	<label>To:</label>
	<input name="UserName" autofocus>
	<p>
		<button type="submit" name="Save">Send one here</button>
	</p>
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>