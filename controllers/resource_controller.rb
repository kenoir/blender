require_relative('../models/json_loader.rb')
require_relative('../models/rdf_loader.rb')
require_relative('../models/blender.rb')

class ResourceController
  require 'json'

  attr_accessor :rdf_loader, :resource_uri

  def get(type,id)
    @rdf_loader = JuicerRDFLoader.new
    @json_loader = JuicerJSONLoader.new
    @blender = Blender.new

    resources = []

    case type
    when :identifier
      rdf = @rdf_loader.get_identifer(id)
      resources.push(:rdfxml => rdf)
    when :event
      rdf = @rdf_loader.get_event(id)
      resources.push(:rdfxml => rdf)
    when :article
      json = @json_loader.get_article(id)         
      rdf = @rdf_loader.get_identifer(article_rdf_id_from_json(json))

      resources.push(:json => json)
      resources.push(:rdfxml => rdf)
    else
      raise "Invalid resource type!"
    end

    @blender.blend(resources)
  end

  private 
  def article_rdf_id_from_json(json)
    parsed_json = JSON.parse json
    parsed_json["article"]["url"]
  end

end
