"use strict";

$(document).ready(function() {
	
	function getName(n) {
		var name = generator.word(n);
		var f = gender.isFemale(name);
		var m = gender.isMale(name);
		return name + (f ? ' <span class="tag tag--female">f</span>' : '') + (m ? ' <span class="tag tag--male">m</span>' : '');
	}
	
	function bindButtonEvents() {
		$('.save').on('click', function(e) {
			$('#favorites').append('<li><span class="name">' + $(e.target).closest('li').find('.name').html() + '</span></li>');
			$(e.target).remove();
		});
	}
	
	$('#generator').on('click', function() {
		var nameLength = parseInt($('#name-length').val(), 10);
		$('#names').children().remove();
		for (var i = 0; i < 10; i++) {
			$('#names').append('<li><span class="name">' + getName(nameLength) + '</span> <button class="save">Add to favorites</button></li>');
		}
		bindButtonEvents();
	});
	
});