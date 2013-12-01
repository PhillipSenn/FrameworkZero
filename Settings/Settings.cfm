<cfscript>
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<form>
	<p>
	<div class="btn-group">
	  <button type="button" name="LogDB" value="1"<cfif  session.fw0.LogDB> class="btn-primary"</cfif>>Log Database</button>
	  <button type="button" name="LogDB" value="0"<cfif !session.fw0.LogDB> class="btn-primary"</cfif>>Off</button>
	</div>
	</p>
	<p>
	<div class="btn-group">
	  <button type="button" name="LogDBErr" value="1"<cfif  session.fw0.LogDBErr> class="btn-primary"</cfif>>Log DB Errors</button>
	  <button type="button" name="LogDBErr" value="0"<cfif !session.fw0.LogDBErr> class="btn-primary"</cfif>>Off</button>
	</div>
	</p>
	<p>
	<div class="btn-group">
	  <button type="button" name="LogCFErr" value="1"<cfif  session.fw0.LogCFErr> class="btn-primary"</cfif>>Log CF Errors</button>
	  <button type="button" name="LogCFErr" value="0"<cfif !session.fw0.LogCFErr> class="btn-primary"</cfif>>Off</button>
	</div>
	</p>
	<p>
	<div class="btn-group">
	  <button type="button" name="LogUI" value="1"<cfif  session.fw0.LogUI> class="btn-primary"</cfif>>Log UI</button>
	  <button type="button" name="LogUI" value="0"<cfif !session.fw0.LogUI> class="btn-primary"</cfif>>Off</button>
	</div>
	</p>
	<p>
	<div class="btn-group">
	  <button type="button" name="LogJS" value="1"<cfif  session.fw0.LogJS> class="btn-primary"</cfif>>Log JS</button>
	  <button type="button" name="LogJS" value="0"<cfif !session.fw0.LogJS> class="btn-primary"</cfif>>Off</button>
	</div>
	</p>
</form>
<cfinclude template="/Inc/foot.cfm">
<script src="Settings.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>