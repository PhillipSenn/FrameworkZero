<cfscript>
LogDBErr = new LogDBErr().Top1000();
StructDelete(request,"Bootstrap");
SaveDate = '';
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th class="num">DBErr</th>
			<th class="num">User</th>
			<th class="num">Sort</th>
			<th class="num">Elapsed</th>
			<th class="num">ColdFusion<br>Page</th>
			<th>Function</th>
			<th>Error</th>
			<th>Type</th>
			<th>Message</th>
			<th>Detail</th>
			<th class="num">Code</th>
			<th class="num">SQL<br>State</th>
			<th>Where</th>
			<th class="num">Date</th>
			<th class="num">Time</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="LogDBErr.qry">
			<tr>
				<td class="num">#LogDBErrID#</td>
				<td class="num" title="#UsrName#">#UsrID#</td>
				<td class="num">
					<cfif LogDBErrSort>
						#LogDBErrSort#
					</cfif>
				</td>
				<td class="num">
					<cfif LogDBErrElapsed>
						#LogDBErrElapsed#
					</cfif>
				</td>
				<td class="num"><a href="../LogCF/LogCF.cfm?LogCFID=#LogCFID#">#LogCFID#</a></td>
				<td>
					<cfif LogDBErrComponentName NEQ "">
						#LogDBErrComponentName#()<br>
					</cfif>
					#LogDBErrFunctionName#
				</td>
				<td>#LogDBErrName#</td>
				<td>#LogDBErrType#</td>
				<td>#LogDBErrMessage#</td>
				<td>#LogDBErrDetail#</td>
				<td class="num">
					<cfif LogDBErrCode>
						#LogDBErrCode#
					</cfif>
				</td>
				<td class="num">
					<cfif LogDBErrSQLState>
						#LogDBErrSQLState#
					</cfif>
				</td>
				<td class="num">#LogDBErrWhere#</td>
				<td class="num">
					<cfif SaveDate NEQ DateFormat(LogDBErrDateTime,"mm/dd")>
						<cfset SaveDate = DateFormat(LogDBErrDateTime,"mm/dd")>
						#SaveDate#
					</cfif>
				</td>
				<td class="num monospace">#TimeFormat(LogDBErrDateTime,"h:nn:ss:llltt")#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>