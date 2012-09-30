describe 'Application' do
  include Rack::Test::Methods

  it "should provide RDF endpoint" do
    get '/rdf?identifier=http://someresource'
    stub_response_status.should == "200"
  end
  
end