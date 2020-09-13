require 'active_support/concern'

module RecaptchaVerifiable
	extend ActiveSupport::Concern

	included do
		before_action :recaptcha, only: [:create_account]
	end

	def recaptcha
		reroute_failed_recaptcha && return unless RecaptchaVerifier.verify(params["recaptcha-response"], request.ip)
	end

	def reroute_failed_recaptcha 
		@person 		= Person.new
		flash.now[:error] = "Please verify you are not a robot."
		render action: "new"
	end
end