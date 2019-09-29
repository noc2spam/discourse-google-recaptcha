# name: recaptcha
# about: add Google Recaptcha to Sign Up form
# version: 0.1
# authors: klaudgrave
# url: https://github.com/klaudgrave

#gem 'recaptcha', '5.1.0'

enabled_site_setting :recaptcha_enabled
	load File.expand_path('../lib/google_recaptcha.rb', __FILE__)
	load File.expand_path('../services/recaptcha_verifier.rb', __FILE__)
	load File.expand_path('../app/controllers/concerns/recaptcha_verifiable.rb', __FILE__)

after_initialize do 
	load File.expand_path('../app/controllers/recaptcha_controller.rb', __FILE__)


	Discourse::Application.routes.append do 
		#put '/grverify' => 'recaptcha#verify'
		#mount ::RecaptchaVerifiable::recaptcha, at: "/grverify"
		match '/grverify' => 'recaptcha#index', :via => :post
	end
end

