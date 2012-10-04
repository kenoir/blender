describe 'Application' do
  include Rack::Test::Methods
  
  before (:each) do
  	@stub_request = my_stub_request
  end
  
  it "should provide RDF endpoint" do
    get '/rdf?identifier=http://someresource'
    @stub_request.response.status.should == "200"
  end
  
end