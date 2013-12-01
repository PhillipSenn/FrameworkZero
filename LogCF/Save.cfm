<cfscript>
url.a = 'a';
url.b = 'b';
form.c = 'c';
form.d = 'd';
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfset new com.LogCF().Save()>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>