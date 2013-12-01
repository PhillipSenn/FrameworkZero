(function() {
	log(this);
	debugger;
	
	// http://www.w3.org/TR/2011/WD-html5-20110405/author/offline.html#browser-state
	if (navigator.onLine) { // http://www.icenium.com/community/blog/icenium-team-blog/2013/04/23/is-this-thing-on-(part-1)
		NowOnline();
	} else {
		NowOffline();
	}
	
	window.addEventListener("online", NowOnline, false);
	window.addEventListener("offline", NowOffline, false);

	$(document).on('click','.ConnectionStatus',ToggleConnectionStatus)
	function ToggleConnectionStatus() {
		log(this.name);
		debugger;
		var local = {};
		
		if ($(this).text() == 'ONLINE') {
			NowOffline();
		} else {
			if (navigator.onLine) {
				local.type = 'get';
				local.data = {};
				local.dataType = 'text';
				local.data.method = 'Read';
				local.Promise = $.ajax('Ping.cfc',local);
				local.Promise.done(NowOnline);
				local.Promise.fail(fail);
			}
		}
	}
	function fail() {
		LogJS('fail');
		request.isConnected = false;
		$('.ConnectionStatus').text('NO INTERNET').addClass('btn-warning').removeClass('btn-primary btn-danger');
	}

	function NowOnline() {
		LogJS('NowOnline');
		$('.ConnectionStatus').text('ONLINE').addClass('btn-primary').removeClass('btn-warning btn-danger');
	};
	
	function NowOffline() {
		LogJS('NowOffline');
		$('.ConnectionStatus').text('OFFLINE').addClass('btn-danger').removeClass('btn-warning btn-primary');
	};
})();

/*
(function() {
	var fireEvent = function(name, data) {
		var e = document.createEvent("Event");
		e.initEvent(name, true, true);
		e.data = data;
		window.dispatchEvent(e);
	};

var fetch = function(url, callback) {
  var xhr = new XMLHttpRequest();

  var noResponseTimer = setTimeout(function() {
    xhr.abort();
    fireEvent("connectiontimeout", {});
    if (!!localStorage[url]) {
      // We have some data cached, return that to the callback.
      callback(localStorage[url]);
      return;
    }
  }, maxWaitTime);

  xhr.onreadystatechange = function(e) {
    if (xhr.readyState != 4) {
      return;
    }

    if (xhr.status == 200) {
      fireEvent("goodconnection", {});
      clearTimeout(noResponseTimer);
      // Save the data to local storage
      localStorage[url] = xhr.responseText;
      // call the handler
      callback(xhr.responseText);
    } else {
      fireEvent("connectionerror", {});
      // There is an error of some kind, use our cached copy (if available).
      if (!!localStorage[url]) {
        // We have some data cached, return that to the callback.
        callback(localStorage[url]);
        return;
      }
    }
  };
  xhr.open("GET", url);
  xhr.send();
};
})();
*/
