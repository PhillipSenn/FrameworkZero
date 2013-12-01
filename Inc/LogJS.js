function LogJS(argLogJSName) {
	if (navigator.onLine) {
		var local = {};

		local.data = {};
		local.data.LogJSName = argLogJSName;
		local.data.LogJSDesc = LogJS.caller.toString();
		local.data.UsrID = request.fw0.LogJS_UsrID.val() || 0;
		request.fw0.LogJSSort += 1;
		local.data.LogJSSort = request.fw0.LogJSSort;
		local.data.LogJSPathName = window.location.pathname;
		local.data.TickCount = request.fw0.TickCount.val();
		local.dataType = 'text'; // no return value.
		local.data.method = 'Save';
		local.Promise = $.ajax(request.fw0.HomeDir.val() + 'com/LogJS.cfc',local);
		//local.Promise.done(LogJSDone);
		//local.Promise.fail(LogJSFail);
	}
	/*
	function LogJSDone(data, textStatus, jqXHR) {
		// debugger;
	}
	function LogJSFail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
	*/
}
