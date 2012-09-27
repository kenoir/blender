describe 'Application' do
  include Rack::Test::Methods

  it "should provide RDF endpoint" do
    get '/rdf?identifier=http://juicer.responsivenews.co.uk/events/18'
    last_response.should be_ok
  end
  
end