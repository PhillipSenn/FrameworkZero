(function() {
	if (!$('#Print').length) {
		if ($('section').length) {
			$('section:first').append('<p id="Print"></p>');
		} else {
			$('body').append('<p id="Print"></p>');
		}
	}
})();

function Print(x) {
	$('#Print').append(x + '<br>');
}