
/*import { ajax } from 'discourse/lib/ajax';

/*export default Ember.Route.extend({
	model() {
		//console.log(ajax('/grverify/response.json'));
		Discourse.ajax('/grverify', {
			type: 'POST',
			data: {recaptcha_response: g-recaptcha_response}
		}).then(function(res) {
			if (res.verify) {
				console.log('dada');
			}
			console.log(res);
		});
	
		//return ajax('/grverify/response.json');
	}
});*/
/*
App.grVerifyService = Ember.Service.extend({
	function grVerify() {
		Discourse.ajax('/grverify', {
				type: 'POST',
				data: {recaptcha_response: g-recaptcha-response}
			}).then(function(res) {
				if (res.verify) {
					console.log('dada');
				}
				console.log(res);
			});
	}
});
*/
/*
function formGRSubmit() {
	  $.ajax({
	  	type: 'POST',
	  	contentType: 'application/json; charset=utf-8',
	  	url: "/grverify",
	  	data: JSON.stringify({recaptcha_response: g-recaptcha_response}),
	  	dataType: 'json',
	  	success: function (res) {
	  		console.log(res);
	  	},
	  	error: function () {
	  		console.log('failure');
	  	}
	  });
}*/
