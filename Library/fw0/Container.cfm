<cfif IsDefined("request.Bootstrap.Container") AND request.Bootstrap.Container>
	<cfoutput>
	<div class="container">
		<span id="msg">#request.msg#</span>
	</div>
	</cfoutput>
	<section class="container">
<cfelse>
	<cfoutput>
	<div>
		<span id="msg">#request.msg#</span>
	</div>
	</cfoutput>
</cfif>

