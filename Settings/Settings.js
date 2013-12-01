(function() {
	$(document).on('click','[name=LogDB]',LogDBClicked);
	function LogDBClicked() {
		var local = {};

		local.data = {};
		local.context = this;
		local.data.LogDB = $(this).val();
		
		local.dataType = 'text'; // no return value.
		local.data.method = 'SaveDB';
		local.Promise = $.ajax('Settings.cfc',local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	}
	function done(data, textStatus, jqXHR) {
		$('[name=LogDB]').removeClass('btn-primary').addClass('btn-default');
		$(this).addClass('btn-primary').removeClass('btn-default');
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
})();

(function() {
	$(document).on('click','[name=LogDBErr]',LogDBErrClicked);
	function LogDBErrClicked() {
		var local = {};

		local.data = {};
		local.context = this;
		local.data.LogDBErr = $(this).val();
		
		local.dataType = 'text'; // no return value.
		local.data.method = 'SaveDBErr';
		local.Promise = $.ajax('Settings.cfc',local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	}
	function done(data, textStatus, jqXHR) {
		$('[name=LogDBErr]').removeClass('btn-primary').addClass('btn-default');
		$(this).addClass('btn-primary').removeClass('btn-default');
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
})();

(function() {
	$(document).on('click','[name=LogCFErr]',LogCFErrClicked);
	function LogCFErrClicked() {
		var local = {};

		local.data = {};
		local.context = this;
		local.data.LogCFErr = $(this).val();
		
		local.dataType = 'text'; // no return value.
		local.data.method = 'SaveCFErr';
		local.Promise = $.ajax('Settings.cfc',local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	}
	function done(data, textStatus, jqXHR) {
		$('[name=LogCFErr]').removeClass('btn-primary').addClass('btn-default');
		$(this).addClass('btn-primary').removeClass('btn-default');
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
})();

(function() {
	$(document).on('click','[name=LogUI]',LogUIClicked);
	function LogUIClicked() {
		var local = {};

		local.data = {};
		local.context = this;
		local.data.LogUI = $(this).val();
		
		local.dataType = 'text'; // no return value.
		local.data.method = 'SaveUI';
		local.Promise = $.ajax('Settings.cfc',local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	}
	function done(data, textStatus, jqXHR) {
		$('[name=LogUI]').removeClass('btn-primary').addClass('btn-default');
		$(this).addClass('btn-primary').removeClass('btn-default');
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
})();

(function() {
	$(document).on('click','[name=LogJS]',LogJSClicked);
	function LogJSClicked() {
		var local = {};

		local.data = {};
		local.context = this;
		local.data.LogJS = $(this).val();
		
		local.dataType = 'text'; // no return value.
		local.data.method = 'SaveJS';
		local.Promise = $.ajax('Settings.cfc',local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	}
	function done(data, textStatus, jqXHR) {
		$('[name=LogJS]').removeClass('btn-primary').addClass('btn-default');
		$(this).addClass('btn-primary').removeClass('btn-default');
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
})();