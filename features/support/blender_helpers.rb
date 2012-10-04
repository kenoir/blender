module BlenderHelpers

  def response_should_be_valid
    @stub_request.response.status.should == [200,""]
  end

  def data_should_be_valid_rdf_xml
    options = { :validate => true }  
    RDF::Reader.for(:rdfxml).new(@stub_request.response.body, options)	
  end

  def rdf_should_contain_statements
    mock_rdf_graph.count.should > 0 
  end

  def rdf_should_contain_a_label		
    name = ''
    if query_solutions.count > 0
      solution_hash = query_solutions.first.to_hash
      name = solution_hash[:name]
      name = name.value
    end
    name.should_not be_empty
  end

  def rdf_should_contain_a_description
    description = ''
    if query_solutions.count > 0
      solution_hash = query_solutions.first.to_hash
      description = solution_hash[:description]
      description = description.value
    end
    description.should_not be_empty		
  end

  def mock_rdf_graph
    rdf_graph = RDF::Graph.new()
    RDF::Reader.for(:rdfxml).new(@stub_request.response.body) do |reader|
      reader.each_statement do |statement|
        rdf_graph.insert(statement)
      end
    end
    rdf_graph
  end

  def query_solutions
    query = RDF::Query.new(:content => {
      RDFS.label => :name,
      DC.abstract => :description
    })
    solutions = query.execute(mock_rdf_graph)
    solutions
  end

  # Little debug helper
  # TODO: Move to a debug helper module
  def print_solutions
    query_solutions.each do |solution|
      solution.each_value do |value|
        puts 'VALUE EQUALS ' + value.inspect
      end
    end
  end

end

