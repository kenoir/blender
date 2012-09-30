describe IndexController do

  subject { 
  	indexController = IndexController.new(event_api_endpoint)
  }

  describe IndexController, "#initialize" do
    it 'should create and set a RDF loader model object' do
    	subject.rdf_loader.should be_an_instance_of(RDFLoader)
    end  
  end  
  
  describe IndexController, "#run!" do 
    it 'should return a RDF string representation of the resource data' do
        		
    	@rdfLoaderMock = mock(RDFLoader)
    	@rdfLoaderMock.stub!(:getData).and_return(stub_response_body)    	
    	subject.rdf_loader = @rdfLoaderMock
    	   	
    	rdf_data = subject.run!    	
    	options = { :validate => true }
	    RDF::Reader.for(:rdfxml).new(rdf_data, options)
	    clear_stub_request
    end
  end

end
