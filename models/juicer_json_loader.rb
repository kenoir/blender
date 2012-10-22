require_relative('resource_loader.rb')

class JuicerJSONLoader < ResourceLoader
  require 'open-uri'

  def get_event(id)
    get( juicer_event_uri(id), {:accept => "application/json"} )
  end

  def get_article(id)
    get( juicer_article_uri(id), {:accept => "application/json"} )
  end

  def get_about(id)
    get( juicer_semantic_about(id), {:accept => "application/json"})
  end

  def juicer_semantic_about(id)
    "http://juicer.responsivenews.co.uk/api/articles?binding=a&limit=5&#{juicer_about_query(id)}"
  end

  def juicer_about_query(id)
    URI::encode("where=?a <http://data.press.net/ontology/tag/about> <http://dbpedia.org/resource/#{id}>")
  end

  def juicer_event_uri(id)
    "http://juicer.responsivenews.co.uk/events/#{id}.json"
  end

  def juicer_article_uri(id)
    "http://juicer.responsivenews.co.uk/articles/#{id}.json"
  end

end

  

