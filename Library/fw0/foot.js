"use strict";
var request = {};
request.dom = {}; // Cached Document Object Model elements.
request.fw0 = {}; // function LogJS and Framework Zero variables.

(function() {
	var local = {};
	local.type = 'post';
	local.dataType = 'json';
	local.cache = false;
	$.ajaxSetup(local);
	
	$('form').on('click','button:submit[name="Delete"]',function() {
		return window.confirm(this.title || 'Delete this record?');
	});
	$('form').attr('method','post'); // Any form will default to method="post"
	$('body').removeAttr('hidden');
})();

window.log = function(X){
	console.log( X );
	console.table(X);
};
