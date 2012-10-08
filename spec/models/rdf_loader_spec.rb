describe RDFLoader do

  subject { RDFLoader.new(event_uri) }

  describe RDFLoader, "#initialize" do
    it 'should set an internal reference to the resource URI' do
      subject.uri.should == event_uri
    end

    it 'should set an internal reference to a Rest Client object' do
      subject.rest_client.should == RestClient
    end
  end

  describe RDFLoader, "#get_data" do
    it 'should get valid data for a given URL' do

      stub_rdf_endpoint(juicer_rdf_event_endpoint,stub_event_rdf) 

      rdf_data =  subject.get_data
      options = { :validate => true }

      RDF::Reader.for(:rdfxml).new(rdf_data, options)    		
      clear_stub_requests
    end		
  end	
end
