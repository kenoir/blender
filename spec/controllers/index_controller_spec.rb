describe IndexController do

  subject { IndexController.new(resource_uri) }

  describe IndexController, "#initialize" do
    it 'should create and set a RDF wrapper model object' do
    	subject.rdf_wrapper.should be_an_instance_of(RDFWrapper)
    end  
  end 
  
  
  describe IndexController, "#run!" do 
    it 'should return a RDF string representation of the resource data' do
    	pending
    	subject.run!	
    end
  end

end
