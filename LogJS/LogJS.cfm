<cfscript>
LogJS = new LogJS().Top1000();
StructDelete(request,"Bootstrap");
SaveDate = '';
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th class="num">LogJS</th>
			<th class="num">User</th>
			<th class="num">Sort</th>
			<th class="num">Elapsed</th>
			<th>PathName</th>
			<th>LogJSName</th>
			<th class="num">Date</th>
			<th class="num">Time</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="LogJS.qry">
			<tr>
				<td class="num">#LogJSID#</td>
				<td class="num" title="#UsrName#">#UsrID#</td>
				<td class="num">
					<cfif LogJSSort>
						#LogJSSort#
					</cfif>
				</td>
				<td class="num">
					<cfif LogJSElapsed>
						#NumberFormat(LogJSElapsed)#
					</cfif>
				</td>
				<td>#LogJSPathName#</td>
				<td><a href="LogJSDesc.cfm?LogJSID=#LogJSID#">#LogJSName#</a></td>
				<td class="num">
					<cfif SaveDate NEQ DateFormat(LogJSDateTime,"mm/dd")>
						<cfset SaveDate = DateFormat(LogJSDateTime,"mm/dd")>
						#SaveDate#
					</cfif>
				</td>
				<td class="num monospace">#TimeFormat(LogJSDateTime,"h:nn:ss:llltt")#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>