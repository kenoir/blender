module BlenderHelpers

  def response_should_be_ok(response)
    response.status.should == 200
  end

  def response_should_be_valid_rdf_xml(response)
    options = { :validate => true }  
    RDF::Reader.for(:rdfxml).new(response.body, options)	
  end

  def rdf_should_contain(graph,query,key)
    value = ''
    solutions = query_solutions(graph, query)

    if solutions.count > 0
      solution_hash = solutions.first.to_hash
      value = solution_hash[key]
      value = value.value
    end
    value.should_not be_empty
  end

  def request_rdf_graph(path)
    path.strip!    
    eval_path = eval("\"#{path}\"")

    get(eval_path)
    rdf_graph(last_response)
  end

  def rdf_graph(response)
    graph = RDF::Graph.new()
    RDF::Reader.for(:rdfxml).new(response.body) do |reader|
      reader.each_statement do |statement|
        graph.insert(statement)
      end
    end
    graph
  end

  def query_solutions(graph, query)
    query = RDF::Query.new(:content => query)
    solutions = query.execute(graph)
    solutions
  end

end

