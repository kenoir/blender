module JuicerJsonTripleExtractors
  module ExtractAgentTriples

    def self.extract(parsed_json)
      subject_uri = RDF::URI.new(parsed_json["article"]["url"])
      agentin_uri = RDF::URI.new("http://purl.org/NET/c4dm/event.owl#agent")

      people = parsed_json["article"]["people"]
      orgs = parsed_json["article"]["organisations"]

      agents = people + orgs

      triples = []
      agents.each do | agent |

        agent_uri = RDF::URI.new(agent['dbpedia_url'])

        triple = {
          :subject => subject_uri,
          :predicate => agentin_uri,
          :object =>  agent_uri
        }

        triples.push(triple)

      end

      triples
    end

  end
end
