<cfscript>
LogDB = new LogDB().Top1000();
StructDelete(request,"Bootstrap");
SaveDate = '';
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

<table>
	<thead>
		<tr>
			<th class="num">&nbsp;</th>
			<th class="num">1</th>
			<th class="num">3</th>
			<th class="num">7</th>
			<th>4 &amp; 5</th>
			<th>2</th>
			<th class="num">6</th>
			<th class="num">8</th>
			<th class="num">9</th>
			<th class="num">9</th>
		</tr>
		<tr>
			<th class="num">User</th>
			<th class="num">LogDBID</th>
			<th class="num">Sort</th>
			<th class="num">Elapsed</th>
			<th>Function</th>
			<th>LogDBName</th>
			<th class="num">Record<br>Count</th>
			<th class="num">Exec<br>Time</th>
			<th class="num">Date</th>
			<th class="num">Time</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="LogDB.qry">
			<tr>
				<td class="num" title="#UsrName#">#UsrID#</td>
				<td class="num">#LogDBID#</td>
				<td class="num">
					<cfif LogDBSort>
						#LogDBSort#
					</cfif>
				</td>
				<td class="num">
					<cfif LogDBElapsed>
						#LogDBElapsed#
					</cfif>
				</td>
				<td>
					<cfif LogDBComponentName NEQ "">
						#LogDBComponentName#()<br>
					</cfif>
					#LogDBFunctionName#
				</td>
				<td class="pre">#LogDBName#</td>
				<td class="num">
					<cfif LogDBRecordCount>
						#LogDBRecordCount#
					</cfif>
				</td>
				<td class="num">
					<cfif LogDBExecutionTime>
						#LogDBExecutionTime#
					</cfif>
				</td>
				<td class="num">
					<cfif SaveDate NEQ DateFormat(LogDBDateTime,"mm/dd")>
						<cfset SaveDate = DateFormat(LogDBDateTime,"mm/dd")>
						#SaveDate#
					</cfif>
				</td>
				<td class="num monospace">#TimeFormat(LogDBDateTime,"h:nn:ss:llltt")#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>