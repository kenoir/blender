require_relative('resource_loader.rb')

class IncubatorRDFLoader < ResourceLoader
  require 'open-uri'

  def get_learn_resources(id)
    get(incubator_query_uri(URI::encode( learn_about_query(id))),
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
  def learn_about_query(id)
    "PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n" +
    "PREFIX learn: <http://www.bbc.co.uk/ontologies/learn/>\n" +
    "CONSTRUCT { ?a a learn:resource; rdf:about <http://dbpedia.org/resource/#{id}> . }\n" +
    "WHERE { ?a rdf:about <http://dbpedia.org/resource/#{id}> . }\n"
  end

end
