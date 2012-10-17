require_relative('resource_loader.rb')

class JuicerRDFLoader < ResourceLoader

  def get_dbpedia_identifier(id)
    get_identifier("http://dbpedia.org/resource/#{id}")
  end

  def get_identifier(id)
    get( juicer_rdf_uri(id), {:accept => "application/rdf+xml"} ) 
  end

  def get_event(id)
    get( juicer_rdf_uri(juicer_event_uri(id)), {:accept => "application/rdf+xml"})
  end

  def juicer_event_uri(id)
    "http://juicer.responsivenews.co.uk/events/#{id}"
  end

  def juicer_rdf_uri(uri)
    "http://juicer.responsivenews.co.uk/rdf?identifier=#{uri}" 
  end

end
