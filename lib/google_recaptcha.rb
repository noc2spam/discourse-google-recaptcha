class GoogleRecaptcha
	BASE_URL 	= "https://www.google.com/".freeze
	VERIFY_URL  = "recaptcha/api/siteverify".freeze

	def initialize
		@client = Faraday.new(BASE_URL)
	end

	def verify_recaptcha(params)
		response = perform_verify_request(params)
		return success?(response)
	end

	def success?(response)
		JSON.parse(response.body)["success"]
	end

	private

	attr_reader :client

	def perform_verify_request(params)
		client.post(VERIFY_URL) do |req|
			req.params = params.merge({secret: SiteSetting.recaptcha_secret_key})
		end
	end
end