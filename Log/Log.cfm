<cfscript>
Log = new Log().GrandUnification();
StructDelete(request,"Bootstrap");
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th class="num">Date</th>
			<th class="num">Time</th>
			<th class="num">User</th>
			<th>IP Address</th>
			<th>Type</th>
			<th class="num">DBSort</th>
			<th class="num">JSSort</th>
			<th class="num">Elapsed</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Log.qry">
			<tr>
				<td class="num">#DateFormat(LogDateTime,"mm/dd")#</td>
				<td class="num monospace">#TimeFormat(LogDateTime,"hh:mm:ss:llltt")#</td>
				<td class="num">#UsrID#</td>
				<td>#RemoteAddr#</td>
				<td>#Type#</td>
				<td class="num">#DBSort#</td>
				<td class="num">#JSSort#</td>
				<td class="num">#Elapsed#</td>
				<td>
					#LogName#
					<br>
					#Description#
				</td>
			</tr>
		</cfloop>
	</tbody>
</table>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>