<cfscript>
param request.js = true;
</cfscript>

<!doctype html>
<html lang="en" class="no-js">
<head>
<cfoutput>
<meta charset="utf-8">
<meta content="Phillip Senn" name="author">
<cfif IsDefined("request.fw0.cache")>
	<meta content="no-cache, no-store, must-revalidate" http-equiv="Cache-Control">
	<meta content="no-cache"                            http-equiv="Pragma">
	<meta content="0"                                   http-equiv="Expires">
</cfif>
<cfif StructKeyExists(request,"Bootstrap")>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link rel="stylesheet" href="/Library/Bootstrap3/dist/css/bootstrap.css">
<link rel="stylesheet" href="/Library/Bootstrap3/dist/css/bootstrap-theme.css">
<link rel="stylesheet" href="/Library/fw0/html.css">
<link rel="stylesheet" href="#Application.fw0.dir#Inc/html.css">
<cfelse>
<link rel="stylesheet" href="/Library/fw0/htmlPlain.css">
</cfif>
<cfif IsDefined("request.Bootstrap.icons") AND request.Bootstrap.icons>
	<link rel="stylesheet" href="/Library/fw0/icons.css">
</cfif>	
<cfif request.js>
	<script src="/Library/jQuery/jQuery.js"></script>
</cfif>
</cfoutput>