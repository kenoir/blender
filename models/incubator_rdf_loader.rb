require_relative('resource_loader.rb')

class IncubatorRDFLoader < ResourceLoader
  require 'open-uri'

  def get_person(id)  
    value = get(incubator_query_uri(URI::encode( agent_query(id))),
        {:accept => "application/rdf+xml"})
  end

  def get_place(id)
    value = get(incubator_query_uri(URI::encode( place_query(id))),
        {:accept => "application/rdf+xml"})
  end

  def get_identifier(id)
    get(incubator_query_uri(URI::encode( identifier_query (id))),
        {:accept => "application/rdf+xml"})
  end

  private
  def incubator_query_uri(query)
    "http://server8.incubator.bbc.co.uk:8080/openrdf-sesame/repositories/epp_test?queryLn=SPARQL&infer=true&query=#{query}"
  end

  private 
  def identifier_query(id)
    "CONSTRUCT { <#{id}> ?p ?o . } WHERE { <#{id}> ?p ?o.}"
  end

  private
  def place_query(id)
    "PREFIX event: <http://purl.org/NET/c4dm/event.owl#>\n" +
    "CONSTRUCT { <http://dbpedia.org/resource/#{id}> event:place ?a . }\n" +
    "WHERE { <http://dbpedia.org/resource/#{id}> event:place ?a . }"
  end

  private
  def agent_query(id)
    "PREFIX event: <http://purl.org/NET/c4dm/event.owl#>\n" +
    "CONSTRUCT { <http://dbpedia.org/resource/#{id}> event:agent ?a . }\n" +
    "WHERE { <http://dbpedia.org/resource/#{id}> event:agent ?a . }"
  end
end
