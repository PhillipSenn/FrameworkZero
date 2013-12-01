component {

function Check(DiagnosticName) {
	if (!IsDefined("session.fw0.Diagnostics")) {
		WriteOutput("Diagnostics aren't turned on.");
		abort;
	} else if (session.fw0.Diagnostics == '') {
		WriteOutput("The list of allowable diagnostics is empty.");
		abort;
	} else if (!ListFindNoCase(session.fw0.Diagnostics,arguments.DiagnosticName)) {
		if (FindNoCase(Left(arguments.DiagnosticName,1),'aeiou')) {
			WriteOutput('This is an ');
		} else {
			WriteOutput('This is a ');
		}
		WriteOutput(arguments.DiagnosticName & ' diagnostic, and the only allowable diagnostics are: ' & session.fw0.Diagnostics);
		abort;
	}
}
}