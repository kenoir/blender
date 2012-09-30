module WebmockHelpers

	require 'rdf'
	require 'rdf/rdfxml'
	
	def read_from_file(location)
	    file = File.open(location, "rb")
	    contents = file.read
	end	
		
	def stub_event_file_location
	    File.join(File.dirname(__FILE__), '/data/event_resource.rdfxml')
	end
	  
	def stub_event_rdf
	    read_from_file(stub_event_file_location)
	end
	
	def event_uri
	    'http://juicer.responsivenews.co.uk/events/18'
	end
	
	def event_api_endpoint
	    "/rdf?identifier=#{event_uri}"
	end	
		
	def my_stub_request    
	    config_stub_request	    
		stub_request(:get, event_api_endpoint).
			with(headers: {
		     'Accept' => 'application/rdf+xml',
		     'Content-type' => 'application/rdf+xml',
		     'User-Agent' => 'Ruby',
		     'X-Trackertoken' => '12345'
		    }).
		    to_return(status: "200", 
		    body: stub_event_rdf,
		    headers: {})
	end
	
	def stub_response
		my_stub_request.response
	end
	
	def stub_response_status
		stub_response.status
	end
	
	def stub_response_body
		stub_response.body
	end
	
	def config_stub_request
		WebMock.disable_net_connect!(:allow_localhost => true)
	end
	
	def clear_stub_request
		WebMock.reset!
	end
end