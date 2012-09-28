describe RDFWrapper do
	
	subject {
		rdf_wrapper = RDFWrapper.new(event_rdf_api_endpoint)
		rdf_wrapper.rest_client = dummy_rest_client
		
		rdf_wrapper
	}
	
	describe RDFWrapper, "#initialize" do
	  it 'should set an internal reference to the resource URI' do
	      subject.uri.should eq event_rdf_api_endpoint
	  end
	  
	  it 'should set an internal reference to a Rest Client object' do
	      subject.rest_client.should == dummy_rest_client
	  end
	  
	end
	
	describe RDFWrapper, "#getData" do
	  it 'should get data from a given URL' do
	      rdf_data = subject.getData	      
	      
	      #options = { :validate => true }
	      #RDF::Reader.for(:rdfxml).new(rdf_data, options)
	  end	
	end

end