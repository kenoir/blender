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
    # placeholder for json requests
    triples = [
      { 
        :subject => RDF::URI.new('http://www.example.com'),
        :predicate => RDF::URI.new('http://www.example.com'),
        :object => RDF::URI.new('http://www.example.com')
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
