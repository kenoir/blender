module JuicerJsonTripleExtractors
  module ExtractPlaceTriples

    def self.extract(parsed_json)
      subject_uri = RDF::URI.new(parsed_json["article"]["url"])
      event_place_uri = RDF::URI.new("http://purl.org/NET/c4dm/event.owl#place")

      places = parsed_json["article"]["places"]

      triples = []
      places.each do | place |

        place_uri = RDF::URI.new(place['dbpedia_url'])

        triple = {
          :subject => subject_uri,
          :predicate => event_place_uri,
          :object =>  place_uri
        }

        triples.push(triple)

      end

      triples
    end

  end
end
