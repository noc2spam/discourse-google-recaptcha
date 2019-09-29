/*export default Ember.Controller.extend({
	actions: {
		grVerify(){
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
	    },
	}
});*/