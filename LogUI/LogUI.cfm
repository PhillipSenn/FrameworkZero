<cfscript>
LogUI = new LogUI().Top1000();
StructDelete(request,"Bootstrap");
SaveDate = '';
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th class="num">LogUI</th>
			<th class="num">User</th>
			<th class="num">Sort</th>
			<th>LogUIName</th>
			<th>Tag</th>
			<th>TagName</th>
			<th>ID</th>
			<th>Class</th>
			<th>Destination</th>
			<th>Value</th>
			<th class="num">Date</th>
			<th class="num">Time</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="LogUI.qry">
			<tr>
				<td class="num">#LogUIID#</td>
				<td class="num" title="#UsrName#">#UsrID#</td>
				<td class="num">
					<cfif LogUISort>
						#LogUISort#
					</cfif>
				</td>
				<td>#LogUIName#</td>
				<td>#LogUITag#</td>
				<td>#LogUITagName#</td>
				<td>#LogUIIdentifier#</td>
				<td>#LogUIClass#</td>
				<td>#LogUIDestination#</td>
				<td>#LogUIValue#</td>
				<td class="num">
					<cfif SaveDate NEQ DateFormat(LogUIDateTime,"mm/dd")>
						<cfset SaveDate = DateFormat(LogUIDateTime,"mm/dd")>
						#SaveDate#
					</cfif>
				</td>
				<td class="num monospace">#TimeFormat(LogUIDateTime,"h:nn:ss:llltt")#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>