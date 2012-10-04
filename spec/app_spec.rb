describe 'Application' do
  include Rack::Test::Methods

  before (:each) do
    @stub_request = stub_juicer_rdf_event_endpoint
  end

  it "should provide RDF endpoint" do
    get "/rdf", { "identifier" => event_uri }
    @stub_request.response.status.should == [200,""]
  end

  after(:all) do
    clear_stub_requests
  end

end
