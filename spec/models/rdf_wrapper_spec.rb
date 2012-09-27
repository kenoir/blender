describe RDFWrapper do

	subject {RDFWrapper.new(dummy_resource_uri)}
	
	describe RDFWrapper, "#initialize" do
	  it 'should set an internal reference to the resource URI' do
	      subject.uri.should eq dummy_resource_uri
	  end
	end
	
	describe RDFWrapper, "#getData" do
	  it 'should return a valid RDF string representation of a specific resource' do
	      rdf_data = subject.getData
	      options = { :validate => true }
	      RDF::Reader.for(:rdfxml).new(rdf_data, options)
	  end	
	end

end