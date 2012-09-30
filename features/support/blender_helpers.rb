module BlenderHelpers

	def response_should_be_valid
		stub_response_status.should == "200"
	end
	
	def data_should_be_valid_rdf_xml
		options = { :validate => true }  
		RDF::Reader.for(:rdfxml).new(stub_response_body, options)	
	end
	
	def rdf_should_contain_statements
		mock_rdf_graph.count.should > 0 
	end
	
	def rdf_should_contain_a_name		
		query = RDF::Query.new()
		solutions = query.execute(mock_rdf_graph) do
			pattern [:name, RDF.type, RDF.label]
		end
		solutions.should_not be_empty
	end
	
	def mock_rdf_graph
		rdf_graph = RDF::Graph.new()
		RDF::Reader.for(:rdfxml).new(stub_response_body) do |reader|
			reader.each_statement do |statement|
				rdf_graph.insert(statement)
			end
		end
	end
	
end