module JuicerJsonTripleExtractors
  module ExtractArticleTriples
    
    def self.extract(parsed_json)
      uri = "http://juicer.responsivenews.co.uk/events/#{parsed_json["id"]}"
      subject_uri = RDF::URI.new(uri)
      predicate_uri = RDF::URI.new("http://purl.org/dc/terms/isReferencedBy")

      articles = parsed_json["articles"]

      triples = []
      articles.each do | article |
        
        article_uri = article["url"]

        triple = {
          :subject => subject_uri,
          :predicate => predicate_uri,
          :object => article_uri
        }
        
        triples.push(triple)

      end

      triples
    end
  end
end
