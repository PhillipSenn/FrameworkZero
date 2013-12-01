(function() {
	$('select').change(SelectChanged);
	function SelectChanged() {
		var local = {};

		local.UsrName = $(this).find(':selected').text();
		if (local.UsrName == 'Admin') {
			$('*').removeAttr('hidden');
			$('#Password').focus();
		} else {
			local.data = {};
			local.data.UsrID = $(this).val();
			local.dataType = 'text'; // no return value.
			local.data.method = 'Save';
			local.context = this;
			local.Promise = $.ajax('/FrameworkZero/Login/Login.cfc',local);
			local.Promise.done(done);
			local.Promise.fail(fail);
		}
	}
	function done(RESULT,textStatus,jqXHR) {
		var local = {};
		
		local.UsrName = $(this).find(':selected').text();
		$('#navUsrName').html(local.UsrName + '<b class="caret"></b>');
		$('h1').text('You are now logged in.');
		// $('#UsrID').parent().attr('hidden',true);
		debugger;
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
})();


(function() {
	$(document).on('change','#Password',PasswordChanged);
	function PasswordChanged() {
		var local = {};

		local.data = {};
		local.data.UsrID = $('#UsrID').val();
		local.data.Password = $(this).val();
		local.data.method = 'UsrIDPassword';
		local.Promise = $.ajax('/FrameworkZero/Login/Login.cfc',local);
		local.Promise.done(done2);
		local.Promise.fail(fail);
	}
	function done2(RESULT,textStatus,jqXHR) {
		var local = {};
		// I don't know why RESULT = true here.  It should be a json object.
		if (RESULT.QRY.ROWCOUNT) {
			$('#navUsrName').html(RESULT.QRY.DATA.USRNAME[0] + '<b class="caret"></b>');
			$('h1').text('Click the Framework Zero link again.');
			$('#msg').empty().removeClass('label-danger');
		} else {
			$('#msg').text('Try again.').addClass('label-danger');
		}
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
})();
