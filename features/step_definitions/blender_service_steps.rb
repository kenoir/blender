When /^I request a RDF resource URI$/ do
  visit '/rdf?identifier=http://someresource.that.does.not.exist'
end

Then /^I will get valid RDF XML back$/ do
  pending
  page.driver.response.status.should == 200    
  response = page.driver.response.body
  options = { :validate => true }  
  RDF::Reader.for(:rdfxml).new(response,options)
end



When /^I request an Event RDF resource URI$/ do
  visit '/rdf?identifier=http://juicer.responsivenews.co.uk/events/18'
end

Then /^I will get an Event RDF XML data$/ do
  pending  
  response = page.driver.response.body  
  rdf_graph = RDF::Graph.new()
  RDF::Reader.for(:rdfxml).new(response) do |reader|
      reader.each_statement do |statement|
          rdf_graph.insert(statement)
      end
  end  
  query = RDF::Query.new(
      {:content => {RDF.label => :name} }  
  )  
  solutions = query.execute(rdf_graph)  
  solutions.should_not be_empty  
  
end