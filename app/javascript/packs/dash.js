//this is all the javascript for the dashboard

import $ from 'jquery';

$(function(){
	$('#current').on('click', function(){
		$('#new-role').toggleClass("hidden");
	});
	$('#role-select').on("change", function(){
		$('#new-role').toggleClass("hidden");
		alert ("role changed successfully please refresh the page to view changes");
		});
});
