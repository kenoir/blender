module WebmockHelpers
  require 'rdf'
  require 'rdf/rdfxml'

  def read_from_file(location)
    file = File.open(location, "rb")
    contents = file.read
  end	

  def stub_event_file_location
    File.join(File.dirname(__FILE__), '/data/event_resource.rdfxml')
  end

  def stub_event_rdf
    read_from_file(stub_event_file_location)
  end

  def juicer_rdf_endpoint
    "http://juicer.responsivenews.co.uk/rdf?identifier="
  end

  def person_id
    1
  end

  def event_id
    18
  end

  def event_uri
    "http://juicer.responsivenews.co.uk/events/#{event_id}"
  end

  def juicer_rdf_event_endpoint
    "#{juicer_rdf_endpoint}#{event_uri}" 
  end	

  def stub_rdf_endpoint(endpoint, rdf)
    config_stub_request
    stub_request(:get, endpoint).
      with(:headers => {
      'Accept'=>'application/rdf+xml', 
      'Accept-Encoding'=>'gzip, deflate', 
      'User-Agent'=>'Ruby'}).
        to_return(
          :status => 200, 
          :body => rdf, 
          :headers => {})
  end

  def config_stub_request
    WebMock.disable_net_connect!(:allow_localhost => true)
  end

  def clear_stub_requests
    WebMock.reset!
  end
end
