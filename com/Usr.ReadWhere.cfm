<cfscript>
new com.Diagnostic().Check('select');
Usr = new com.Usr().Where();
Usr = new com.Usr().Read(Usr.qry);
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
I ran the Read() and Where() functions on the Usr table.
#Usr.Prefix.Recordcount#
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>