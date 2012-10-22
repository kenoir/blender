require_relative('../mixin/extractors/juicer_json_content_triples.rb')
require_relative('../mixin/extractors/juicer_json_agent_triples.rb')
require_relative('../mixin/extractors/juicer_json_place_triples.rb')
require_relative('../mixin/extractors/juicer_json_article_triples.rb')

class Blender
  require 'rdf'
  require 'rdf/rdfxml'
  require 'rest-client'
  require 'json'

  include RDF
  include Loggable
  include Cacheable
  include JuicerJsonTripleExtractors

  def blend(resources,id)
    rdf_graph = RDF::Graph.new

    resources.each do | resource |

      if resource.has_key? :juicer_rdfxml
        excluded_predicates = [
          "http://data.press.net/ontology/tag/isTaggedWith",
          "http://data.press.net/ontology/tag/mentions",
          "http://data.press.net/ontology/tag/about",
          "http://purl.org/dc/terms/description"
        ]

        insert_rdfxml_into_graph(
          rdf_graph,
          resource[:juicer_rdfxml],
          excluded_predicates)
      end

      if resource.has_key? :dbpedia_rdfxml
        insert_rdfxml_into_graph(rdf_graph,resource[:dbpedia_rdfxml],[])
      end

      if resource.has_key? :incubator_rdfxml
        insert_rdfxml_into_graph(rdf_graph,resource[:incubator_rdfxml],[])
      end
      
      if resource.has_key? :article_json
        insert_article_json_into_graph(rdf_graph,resource[:article_json])
      end

      if resource.has_key? :event_json
        insert_event_json_into_graph(rdf_graph,resource[:event_json])
      end

      if resource.has_key? :about_json
        insert_about_json_into_graph(rdf_graph,resource[:about_json],id)
      end

    end

    Blender.write(rdf_graph)
  end

  def self.write(graph)
    output = RDF::Writer.for(:rdfxml).buffer do |writer|
      graph.each_statement do |statement|
        writer << statement
      end
    end

    output
  end 

  private
  def insert_about_json_into_graph(rdf_graph,json,id)
    parsed_json = JSON.parse(json)

    uri = "http://dbpedia.org/resource/#{id}"
    article_triples = ExtractArticleTriples.extract(uri,parsed_json)

    append_triples(rdf_graph,article_triples)
  end

  private
  def insert_event_json_into_graph(rdf_graph,json)
    parsed_json = JSON.parse(json)

    uri = "http://juicer.responsivenews.co.uk/events/#{parsed_json["id"]}"
    article_triples = ExtractArticleTriples.extract(uri,parsed_json)

    append_triples(rdf_graph,article_triples)
  end

  private 
  def insert_article_json_into_graph(rdf_graph,json)
    parsed_json = JSON.parse(json)
    content_triples = ExtractContentTriples.extract(parsed_json)
    agent_triples = ExtractAgentTriples.extract(parsed_json)
    place_triples = ExtractPlaceTriples.extract(parsed_json)

    append_triples(rdf_graph,content_triples)
    append_triples(rdf_graph,agent_triples)
    append_triples(rdf_graph,place_triples)
  end

  private
  def insert_rdfxml_into_graph(rdf_graph,rdfxml,excluded_predicates)


    RDF::Reader.for(:rdfxml).new(rdfxml) do |reader|
      reader.each_statement do | statement |
        excluded = false
        excluded_predicates.each do | predicate |
          excluded = true if statement.predicate.to_s == predicate
        end

        if statement.predicate == "http://data.press.net/ontology/tag/about" and
           statement.object.to_s.include? "juicer.responsivenews.co.uk/events/"
         
           excluded = false
        end

        rdf_graph.insert statement if not excluded
      end
    end
  end

  private 
  def append_triples(rdf_graph,triples)
    return if triples.nil?
    triples.each do | triple |
      rdf_graph.insert statement(triple)
    end
  end

  private
  def statement(triple)
    statement = RDF::Statement.new(
      triple[:subject], 
      triple[:predicate],
      triple[:object]
    )
  end
end
