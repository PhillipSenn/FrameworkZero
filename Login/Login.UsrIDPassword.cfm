<cfscript>
Usr = new Login().UsrIDPassword(UsrID:2,Password:'');
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfif Usr.Prefix.Recordcount>
	Login().UsrIDPassword is working.
<cfelse>
	Login().UsrIDPassword is not working.
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>