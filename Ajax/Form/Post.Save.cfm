<cfscript>
new com.Diagnostic().Check('update');
form.UsrID = 0;
session.Usr = new com.Usr().Read(form);
new Post().Save(session.Usr.qry.UsrSort+1);
new Post().Save(session.Usr.qry.UsrSort);
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
I changed UsrID=#session.Usr.qry.UsrID# to #session.Usr.qry.UsrSort+1# and back to #session.Usr.qry.UsrSort# again.
<a href="../../LogDB/LogDB.cfm">LogDB</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>