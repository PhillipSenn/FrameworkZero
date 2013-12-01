<cfscript>
new com.Diagnostic().Check('delete');
form.UsrID = 1;
Usr = new com.Usr().Read(form);
if (Usr.Prefix.Recordcount) {
	Usr = new com.Usr().Delete(form); // todo: insert first
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfif Usr.Prefix.Recordcount>
	I deleted UsrID=1.
<cfelse>
	UsrID=1 is misssing.
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>