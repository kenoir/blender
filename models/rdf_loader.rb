class RDFLoader
	require 'rest_client'
	
	attr_accessor :uri, :rest_client	
	
	def initialize(uri)
		@uri = uri
		@rest_client = getHttpClient
	end
	
	def getData
		response = @rest_client.get(@uri)
		#response = @rest_client.get @uri, {:accept => :rdf+xml}
	end
	
	def getHttpClient
	    RestClient
	end

end