module JuicerJsonTripleExtractors
  module ExtractContentTriples
    require 'rdf'

    include RDF
    include Loggable

    def self.extract(parsed_json)

      subject_uri = RDF::URI.new(parsed_json["article"]["url"])
      abstract_uri = RDF::URI.new("http://purl.org/dc/terms/abstract") 
      description_uri = RDF::URI.new("http://purl.org/dc/terms/description")
      image_uri = RDF::URI.new("http://purl.org/dc/dcmitype/image")

      abstract = image = description = ""

      begin
        abstract = parsed_json["article"]["description"]
        description = parsed_json["article"]["full_data"]["body"]
      rescue Exception => e
        #log("Error parsing JSON: #{parsed_json}",e)
      end

      begin 
        image = parsed_json["article"]["full_data"]["image"]["origin"]
      rescue Exception => e

      end

      # Use placeholder image if empty!
      image = "http://news-labs-events-prototype.herokuapp.com/images/event/event-placeholder.jpeg" if image.empty?

      triples = [
        {
        :subject => subject_uri,        
        :predicate => abstract_uri,  
        :object => RDF::Literal.new(abstract)
      },
        {
        :subject => subject_uri,     
        :predicate => image_uri,        
        :object => RDF::URI.new(image)  
      },
        {
        :subject => subject_uri,     
        :predicate => description_uri,
        :object => RDF::Literal.new(description)  
      }
      ] 

      triples
    end

  end

end
