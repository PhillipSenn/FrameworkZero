request.dom.UsrSort = $('#UsrSort');

(function() {
	$(document).on('click','#Save',SaveClicked);
	function SaveClicked() {
		var local = {};

		local.data = {};
		local.data.UsrSort = request.dom.UsrSort.val();
		local.data.method = 'Save'; 
		local.Promise = $.ajax('Post.cfc',local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	}
	function done(RESULT, textStatus, jqXHR) {
		debugger;
		// What this allows me to do is do a form post followed by a window replace, all so that
		// they can't double submit by pressing refresh.
		// It also allows them to press the back button to go out of the program no matter
		// how many times they've "submitted" the form.
		// A lot of bang for a little bit of buck.  We probably want to just stay on the form
		// and update everything instead of doing a window.replace to refresh the screen.
		window.location.replace(window.location.pathname);
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#responseText').html(jqXHR.responseText);
		debugger;
	}
})();