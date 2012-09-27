module RestAssuredHelpers
  require 'rest-assured'
  require 'rdf'
  require 'rdf/rdfxml'

  def read_from_file(location)
    file = File.open(location, "rb")
    contents = file.read
  end
  
  def event_rdf_resource_uri
    'http://juicer.responsivenews.co.uk/events/18'
  end

  def event_rdf_api_endpoint
    "/rdf?identifier=#{event_rdf_resource_uri}"
  end

  def event_rdf_resource_location
    File.join(File.dirname(__FILE__), '/data/event_resource.rdfxml')
  end
  
  def event_rdf_resource
    read_from_file(event_rdf_resource_location)
  end

  def start_test_api
    RestAssured::Server.start(:port =>6666)
    RestAssured::Double.create(
      :fullpath => event_rdf_api_endpoint,
      :content => event_rdf_resource 
    )
  end

end
