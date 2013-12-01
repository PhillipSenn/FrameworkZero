(function() {
	$(document).on('mouseenter', 'button:submit[name="Delete"]', function() {
		$(this).addClass('btn-danger');
	});
	$(document).on('mouseleave', 'button:submit[name="Delete"]', function() {
		$(this).removeClass('btn-danger');
	});
	$('.icon-ok,.icon-prev,.icon-next,.icon-thumbs-up,.icon-home,.icon-arrow-up,.icon-arrow-down').addClass('glyphicon');
	$('a.btn-lg,a.btn-block,a.btn-default,a.btn-primary,a.btn-success,a.btn-info,a.btn-warning,a.btn-danger,a.btn-link').addClass('btn');
	$('button.btn-lg,button.btn-block,button.btn-default,button.btn-primary,button.btn-success,button.btn-info,button.btn-warning,button.btn-danger,button.btn-link').addClass('btn');
	$('.btn').addClass('btn-lg');

	$('table').not('.no-table').addClass('table');
	$('table').not('.no-hover').addClass('table-hover');
	$('table').not('.no-striped').addClass('table-striped');
	$('table').not('.no-bordered').addClass('table-bordered');
	$('textarea,input:text,input:password,input[type=email],select').addClass('form-control');
	$('button').addClass('btn');
	$('button[name=Save]').addClass('btn-primary');
	$('button#Save').addClass('btn-primary');
	$('.btn')
		.not('.btn-success')
		.not('.btn-primary')
		.not('.btn-info')
		.not('.btn-warning')
		.not('.btn-danger')
		.addClass('btn-default');
	$('section').removeAttr('hidden'); // Trying to keep it from jiggling
})();

