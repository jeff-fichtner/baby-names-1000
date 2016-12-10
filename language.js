/*jshint browser:true*/
var language = (function() {
	"use strict";
	var my = {};
	
	var en = [];
	
	var de = [];
	
	var fr = [];
	
	var it =
	
	my.isCommonWord = function(word) {
		return ((en.indexOf(word) >= 0) || (de.indexOf(word) >= 0) || (fr.indexOf(word) >= 0) || (it.indexOf(word) >= 0) || (es.indexOf(word) >= 0));
	};
	
	return my;
}());