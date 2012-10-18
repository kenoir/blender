require_relative('../models/juicer_json_loader.rb')
require_relative('../models/juicer_rdf_loader.rb')
require_relative('../models/incubator_rdf_loader.rb')

require_relative('../models/blender.rb')

class ResourceController
  require 'json'

  attr_accessor :rdf_loader, :resource_uri

  def get(type,id)
    @juicer_rdf_loader = JuicerRDFLoader.new
    @juicer_json_loader = JuicerJSONLoader.new
    @incubator_rdf_loader = IncubatorRDFLoader.new

    @blender = Blender.new

    resources = []

    case type
    when :identifier
      juicer_rdf = @juicer_rdf_loader.get_identifier(id)
      incubator_rdf = @incubator_rdf_loader.get_identifier(id)

      resources.push(:juicer_rdfxml => juicer_rdf)
      resources.push(:incubator_rdfxml => incubator_rdf)
    when :event
      event_rdf = @juicer_rdf_loader.get_event(id)
      event_json = @juicer_json_loader.get_event(id)

      resources.push(:event_json => event_json)
      resources.push(:juicer_rdfxml => event_rdf)
    when :article
      article_json = @juicer_json_loader.get_article(id)         
      article_rdf = @juicer_rdf_loader.get_identifier(
        article_rdf_id_from_json(article_json))

      resources.push(:article_json => article_json)
      resources.push(:juicer_rdfxml => article_rdf)
    when :people
      dbpedia_rdf = @juicer_rdf_loader.get_dbpedia_identifier(id)
      people_rdf = @incubator_rdf_loader.get_learn_resources(id)

      resources.push(:dbpedia_rdfxml => dbpedia_rdf)
      resources.push(:incubator_rdfxml => people_rdf)
    when :places
      dbpedia_rdf = @juicer_rdf_loader.get_dbpedia_identifier(id)
      places_rdf = @incubator_rdf_loader.get_learn_resources(id)

      resources.push(:dbpedia_rdfxml => dbpedia_rdf)
      resources.push(:incubator_rdfxml => places_rdf)
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
