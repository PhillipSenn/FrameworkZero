<cfscript>
new com.LogDB().Read(1);
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>Success!</h1>
<a href="LogDB.cfm">Now see the log</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>