component {

remote function SaveDB(LogDB) {
	session.fw0.LogDB = arguments.LogDB;
}

remote function SaveDBErr(LogDBErr) {
	session.fw0.LogDBErr = arguments.LogDBErr;
}

remote function SaveCFErr(LogCFErr) {
	session.fw0.LogCFErr = arguments.LogCFErr;
}

remote function SaveUI(LogUI) {
	session.fw0.LogUI = arguments.LogUI;
}

remote function SaveJS(LogJS) {
	session.fw0.LogJS = arguments.LogJS;
}

}
