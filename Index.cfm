<cfscript>
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<ul>
	<li><a href="LogDB/Success.cfm">Generate a LogDB Table found</a></li>
	<li><a href="LogDBErr/Fail.cfm">Generate a LogDBErr Table not found</a></li>
	<li><a href="LogCFErr/Error.cfm">Generate a LogCFErr</a></li>
	<li><a href="LogCF/Save.cfm?e=e">Generate a LogCF</a></li>
	<li><a href="LogUI/Gen.cfm">Generate a LogUI</a></li>
	<li><a href="LogJS/Ping.cfm">Generate a LogJS</a></li>

	<li><a href="Settings/Settings.cfm">Settings</a></li>
	<li><a href="Diagnostics/Diagnostics.cfm">Diagnostics</a></li>
	<li><a href="Ajax/Ajax.cfm">Ajax</a></li>
	<li><a href="Ajax/Form/Post.cfm">Form post via Ajax</a></li>
	<li><a href="Form/Submit.cfm">Form submit</a></li>
	<li><a href="Log/Log.cfm">Grand Unification Log</a></li>
</ul>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>