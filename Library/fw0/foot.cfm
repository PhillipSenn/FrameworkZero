<cfscript>
param request.js = true;
if (StructKeyExists(request,"Bootstrap")) {
	WriteOutput('</section>
');
	if (request.js) {
		WriteOutput('<script src="/Library/fw0/Bootstrap.init.js"></script>
');
		WriteOutput('<script src="/Library/Bootstrap3/dist/js/bootstrap.js"></script>
');
	}
}
if (request.js) {
	WriteOutput('<script src="/Library/fw0/foot.js"></script>
');
}
if ((IsDefined("session.fw0.LogJS") && session.fw0.LogJS) || (IsDefined("session.fw0.LogUI") & session.fw0.LogUI)) {
	param request.fw0.TickCount = GetTickCount();
	WriteOutput('<input type="hidden" id="HomeDir" value="' & Application.fw0.Dir & '">
');
	WriteOutput('<input type="hidden" id="TickCount" value="' & request.fw0.TickCount & '">
');
	if (IsDefined("session.Usr.qry.UsrID")) {
		WriteOutput('<input type="hidden" id="LogJS_UsrID" value="' & session.Usr.qry.UsrID & '">
');
	}
	if (request.js) {
		WriteOutput('<input type="hidden" id="LogJSRemoteAddr" value="' & getPageContext().getRequest().getRemoteAddr() & '">
');
		param request.fw0.LogJS = true;
		if (request.fw0.LogJS) {
			WriteOutput('<script src="' & Application.fw0.dir & 'Inc/LogJS.js"></script>
');
		}
		param request.fw0.LogUI = true;
		if (request.fw0.LogUI) {
			WriteOutput('<script src="' & Application.fw0.dir & 'Inc/LogUI.js"></script>
');
		}
	}
}
</cfscript>
