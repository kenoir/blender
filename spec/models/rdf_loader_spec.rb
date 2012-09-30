describe RDFLoader do
	
	subject {
		rdf_loader = RDFLoader.new(event_api_endpoint)
	}
	
	describe RDFLoader, "#initialize" do
		it 'should set an internal reference to the resource URI' do
	    	subject.uri.should eq event_api_endpoint
		end
	  
		it 'should set an internal reference to a Rest Client object' do
	    	subject.rest_client.should equal RestClient
		end	  
	end
	
	describe RDFLoader, "#getData" do
		it 'should get data from a given URL' do
    		
    		@rdfLoaderMock = mock(RDFLoader)
    		@rdfLoaderMock.stub!(:getData).and_return(stub_response_body)
    		
    		rdf_data = @rdfLoaderMock.getData    		
    		options = { :validate => true }
    		RDF::Reader.for(:rdfxml).new(rdf_data, options)    		
    		clear_stub_request
  		end		
	end	
end