When /^I request a RDF resource URI$/ do
  visit '/rdf?identifier=http://someresource.that.does.not.exist'
end

Then /^I will get valid RDF XML back$/ do
  page.driver.response.status.should == 200
    
  response = page.driver.response.body
  options = { :validate => true }  
  RDF::Reader.for(:rdfxml).new(response,options)
end