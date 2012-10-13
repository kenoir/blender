When /^I request$/ do |path|
    @rdf_graph = request_rdf_graph(path)
    @response = last_response
end

Then /^I should get valid RDF back$/ do  
  response_should_be_ok(@response)
  response_should_be_valid_rdf_xml(@response)
end

Then /^I should get valid Event data$/ do
  response_should_be_ok(@response)
  response_should_be_valid_rdf_xml(@response)
  
  rdf_should_contain(@rdf_graph,{RDFS.label => :name},:name)
  rdf_should_contain(@rdf_graph,{DC.abstract => :description},:description)
end

Then /^I should get valid Person data$/ do
  response_should_be_ok(@response)
  response_should_be_valid_rdf_xml(@response)
end

Then /^I should get valid Place$/ do
  response_should_be_ok(@response)
  response_should_be_valid_rdf_xml(@response)
end

Then /^I should get valid Article data$/ do
  response_should_be_ok(@response)
  response_should_be_valid_rdf_xml(@response)

  rdf_should_contain(@rdf_graph,{DC.abstract => :description},:description)
  rdf_should_contain(@rdf_graph,{DC.title => :title},:title)
end
