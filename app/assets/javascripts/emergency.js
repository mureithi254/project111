$(document).ready(function(){
	//code goes in here
	$('#emergency-switcher').on('click',function(){
		$(this).toggleClass('.emergency-register-form');
		$(this).addClass('display','block');
	});
});