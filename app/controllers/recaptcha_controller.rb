class RecaptchaController < ApplicationController
	include RecaptchaVerifiable

	skip_before_action :verify_authenticity_token

	def index
		#render json: {name: "donut", description: "delicious!"}
		ver = RecaptchaVerifier.verify(params['recaptcha_response'].chomp, request.ip)
		testv = 'test'
		render  json: {verify: ver, test: testv}

	end

	#RecaptchaVerifier.verify(recaptcha_response, ip_address)

	#skip_before_action :check_xhr
#
 	#def index
 	#	Rails.logger.info 'Method called'
	#end
#
	#def verify
	#	Rails.logger.info 'Called RecaptchaController#verify'
	#end
end