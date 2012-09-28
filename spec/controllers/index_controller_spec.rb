describe IndexController do

  subject { IndexController.new(event_rdf_api_endpoint) }

  describe IndexController, "#initialize" do
    it 'should create and set a RDF wrapper model object' do
    	subject.rdf_wrapper.should be_an_instance_of(RDFWrapper)
    end  
  end  
  
  describe IndexController, "#run!" do 
    it 'should return a RDF string representation of the resource data' do
    	subject.rdf_wrapper.rest_client = dummy_rest_client
    	
    	rdf_data = subject.run!
    	
    	options = { :validate => true }
	    RDF::Reader.for(:rdfxml).new(rdf_data, options)
    end
  end

end
