class RDFWrapper
	require 'rest_client'
	
	attr_accessor :uri, :rest_client	
	
	def initialize(uri)
		@uri = uri
		@rest_client = RestClient
	end
	
	def getData
		response = @rest_client.get(@uri)
		response
	end

end