class RecaptchaVerifier
	#def self.verify(response, remote_ip, recaptcha_client=GoogleRecaptcha)
		#new(response, remote_ip, recaptcha_client).verify
		#return false unless recaptcha_response
		#recaptcha_client.verify_recaptcha(response: recaptcha_response, remoteip: remote_ip)
	#end

	def initialiaze(response, remote_ip, recaptcha_client)
		@recaptcha_response = response
		@remote_ip 			= remote_ip
		@recaptcha_client	= GoogleRecaptcha.new
	end

	def self.verify(response, remoteip)
		#return false unless response
		recaptcha_client = GoogleRecaptcha.new
		recaptcha_client.verify_recaptcha(response: response, remoteip: remoteip)
	#rescue
		#false
	end

	private

	attr_reader :recaptcha_client, :recaptcha_response, :remote_ip
end