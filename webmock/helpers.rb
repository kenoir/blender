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

  def stub_event_json_file_location
    File.join(File.dirname(__FILE__), '/data/event_resource.json')
  end

  def stub_article_json_file_location
    File.join(File.dirname(__FILE__), '/data/article_resource.json')
  end

  def stub_article_rdfxml_file_location
    File.join(File.dirname(__FILE__), '/data/article_resource.rdfxml')
  end

  def stub_dummy_rdfxml_file_location
    File.join(File.dirname(__FILE__), '/data/dummy.rdfxml')
  end

  def stub_dummy_rdfxml
    read_from_file(stub_dummy_rdfxml_file_location)
  end

  def stub_event_json
    read_from_file(stub_event_json_file_location)
  end

  def stub_event_rdf
    read_from_file(stub_event_file_location)
  end

  def stub_article_rdfxml
    read_from_file(stub_article_rdfxml_file_location)
  end

  def stub_article_json
    read_from_file(stub_article_json_file_location)
  end

  def juicer_rdf_endpoint
    "http://juicer.responsivenews.co.uk/rdf?identifier="
  end

  def article_uri
    "http://www.bbc.co.uk/news/#{article_id}"
  end

  def dbpedia_id 
   "dbpedia_id" 
  end

  def article_id
    1
  end

  def event_id
    1
  end

  def event_uri
    "http://juicer.responsivenews.co.uk/events/#{event_id}"
  end

  def juicer_json_event_endpoint
    "#{event_uri}.json"
  end

  def juicer_rdf_event_endpoint
    "#{juicer_rdf_endpoint}#{event_uri}" 
  end	

  def juicer_rdfxml_article_endpoint
    "#{juicer_rdf_endpoint}#{article_uri}" 
  end

  def juicer_json_article_endpoint
    "http://juicer.responsivenews.co.uk/articles/#{article_id}.json"
  end
  
  def juicer_rdf_identifier_endpoint
    "http://juicer.responsivenews.co.uk/rdf?identifier=http://dbpedia.org/resource/#{dbpedia_id}"
  end

  def incubator_rdf_identifier_endpoint
    "http://server8.incubator.bbc.co.uk:8080/openrdf-sesame/repositories/epp_test?infer=true&query=CONSTRUCT%20%7B%20%3Chttp://juicer.responsivenews.co.uk/events/1%3E%20?p%20?o%20.%20%7D%20WHERE%20%7B%20%3Chttp://juicer.responsivenews.co.uk/events/1%3E%20?p%20?o.%7D&queryLn=SPARQL"
  end

  def incubator_rdf_place_endpoint
    "http://server8.incubator.bbc.co.uk:8080/openrdf-sesame/repositories/epp_test?infer=true&query=PREFIX%20event:%20%3Chttp://purl.org/NET/c4dm/event.owl%23%3E%0ACONSTRUCT%20%7B%20%3Chttp://dbpedia.org/resource/dbpedia_id%3E%20event:place%20?a%20.%20%7D%0AWHERE%20%7B%20%3Chttp://dbpedia.org/resource/dbpedia_id%3E%20event:place%20?a%20.%20%7D&queryLn=SPARQL"
  end

  def incubator_rdf_agent_endpoint
    "http://server8.incubator.bbc.co.uk:8080/openrdf-sesame/repositories/epp_test?infer=true&query=PREFIX%20event:%20%3Chttp://purl.org/NET/c4dm/event.owl%23%3E%0ACONSTRUCT%20%7B%20%3Chttp://dbpedia.org/resource/dbpedia_id%3E%20event:agent%20?a%20.%20%7D%0AWHERE%20%7B%20%3Chttp://dbpedia.org/resource/dbpedia_id%3E%20event:agent%20?a%20.%20%7D&queryLn=SPARQL"
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
