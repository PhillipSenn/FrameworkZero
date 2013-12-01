<cfscript>
INFORMATION_SCHEMA = new com.INFORMATION_SCHEMA().Where();
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th class="num">Row</th>
			<th>Table Name</th>
			<th class="num">Cols</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="INFORMATION_SCHEMA.qry">
			<tr>
				<td class="num">#CurrentRow#</td>
				<td><a href="../#TABLE_NAME#/#TABLE_NAME#.cfm">#TABLE_NAME#</a></td>
				<td class="num">#Columns#</td>
			</tr>
		</cfloop>
	</tbody>
</table>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>