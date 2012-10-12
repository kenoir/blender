class Blender
  require 'rdf'
  require 'rdf/rdfxml'
  require 'rest-client'
  require 'json'

  include RDF
  include Loggable
  include Cacheable

  def blend(resources)
    rdf_graph = RDF::Graph.new

    resources.each do | resource |

      if resource.has_key? :rdfxml
        insert_rdfxml_into_graph(rdf_graph,resource[:rdfxml])
      end
      
      if resource.has_key? :json
        insert_json_into_graph(rdf_graph,resource[:json])
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
  def insert_json_into_graph(rdf_graph,json)
    parsed_json = JSON.parse(json)
    subject_uri = RDF::URI.new(parsed_json["article"]["url"])

    title_uri = RDF::URI.new("http://purl.org/dc/terms/title")
    description_uri = RDF::URI.new("http://purl.org/dc/terms/abstract") 
    image_uri = RDF::URI.new("http://purl.org/dc/dcmitype/Image")

    title = description = image = ""

    begin
      title = parsed_json["article"]["title"] 
      description = parsed_json["article"]["description"]
      image = parsed_json["article"]["image"]["origin"] 
    rescue Exception => e
      log("Could not parse json: #{parsed_json}",e)
    end

    triples = [
      {
        :subject => subject_uri,        
        :predicate => title_uri,        
        :object => RDF::Literal.new(title)
      },
      {
        :subject => subject_uri,        
        :predicate => description_uri,  
        :object => RDF::Literal.new(description)
      },
      {
        :subject => subject_uri,        
        :predicate => image_uri,        
        :object => RDF::URI.new(image)  
      }
    ] 

    append_triples(rdf_graph,triples)
  end

  private
  def insert_rdfxml_into_graph(rdf_graph,rdfxml)
    RDF::Reader.for(:rdfxml).new(rdfxml) do |reader|
      reader.each_statement do | statement |
        rdf_graph.insert statement
      end
    end
  end

  private 
  def append_triples(rdf_graph,triples)
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
