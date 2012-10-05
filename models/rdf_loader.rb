class RDFLoader
  require 'rest_client'

  attr :rest_client
  attr :uri

  def initialize(uri,rest_client = RestClient)
    @uri = uri

    if not ENV['http_proxy'].nil?
      rest_client.proxy = ENV['http_proxy']
    end
    @rest_client = rest_client 
  end

  def get_data
    response = @rest_client.get(
      juicer_rdf_uri(@uri), 
      { :accept => "application/rdf+xml" })
  end

  def juicer_rdf_uri(uri)
    "http://juicer.responsivenews.co.uk/rdf?identifier=#{uri}" 
  end

end
