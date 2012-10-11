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

  def stub_article_file_location
    File.join(File.dirname(__FILE__), '/data/article_resource.json')
  end

  def stub_event_rdf
    read_from_file(stub_event_file_location)
  end

  def stub_article_json
    read_from_file(stub_article_file_location)
  end

  def juicer_rdf_endpoint
    "http://juicer.responsivenews.co.uk/rdf?identifier="
  end

  def article_id
    1
  end

  def person_id
    1
  end

  def event_id
    1
  end

  def event_uri
    "http://juicer.responsivenews.co.uk/events/#{event_id}"
  end

  def juicer_rdf_event_endpoint
    "#{juicer_rdf_endpoint}#{event_uri}" 
  end	

  def juicer_json_article_endpoint
    "http://juicer.responsivenews.co.uk/articles/#{article_id}.json"
  end

  def stub_endpoint(endpoint, response, accept)
    config_stub_request
    stub_request(:get, endpoint).
      with(:headers => {
      'Accept'=> accept, 
      'Accept-Encoding'=>'gzip, deflate', 
      'User-Agent'=>'Ruby'}).
        to_return(
          :status => 200, 
          :body => response, 
          :headers => {})
  end

  def config_stub_request
    WebMock.disable_net_connect!(:allow_localhost => true)
  end

  def clear_stub_requests
    WebMock.reset!
  end
end
