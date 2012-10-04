describe 'Application' do
  include Rack::Test::Methods
  
  before (:each) do
  	@stub_request = my_stub_request
  end
  
  it "should provide RDF endpoint" do
    get "http://some.uri.that.possibly.just.maybe.does.not.exist"
    @stub_request.response.status.should == "200"
  end
  
end