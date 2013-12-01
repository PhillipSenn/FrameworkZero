<cfscript>
Database = new Database().Diagnostic();
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table class="no-striped">
	<thead>
		<tr>
			<th>Question</th>
			<th>Answer</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Can we display an html page?</td>
			<td><a href="Diagnostic.htm">Try it</a></td>
		</tr>
		<tr>
			<td>Is cfMail working?</td>
			<td><a href="cfMail.cfm">Try it</a></td>
		</tr>
		<tr>
			<td>Can we get to the database?</td>
			<td><a class="#Database.Class#" href="Database.cfm">#Database.Status#</a></td>
		</tr>
		<tr>
			<td>What's changed?</td>
			<td></td>
		</tr>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>