<cfscript>
new Upload().TruncateTable();
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

<cfinclude template="/Inc/foot.cfm">
<script src="/Library/js/yyyymmddhhnnssl.js"></script>
<script src="Upload.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>