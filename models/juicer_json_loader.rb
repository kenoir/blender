require_relative('resource_loader.rb')

class JuicerJSONLoader < ResourceLoader

  def get_event(id)
    get( juicer_event_uri(id), {:accept => "application/json"} )
  end

  def get_article(id)
    get( juicer_article_uri(id), {:accept => "application/json"} )
  end
  
  def juicer_event_uri(id)
    "http://juicer.responsivenews.co.uk/events/#{id}.json"
  end

  def juicer_article_uri(id)
    "http://juicer.responsivenews.co.uk/articles/#{id}.json"
  end

end

  

