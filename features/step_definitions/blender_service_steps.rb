When /^I request$/ do |path|
    @rdf_graph = request_rdf_graph(path)
end

Then /^I should get valid RDF back$/ do  
  response_should_be_valid
  data_should_be_valid_rdf_xml 
end

Then /^I should get valid Event data$/ do
  response_should_be_valid
  data_should_be_valid_rdf_xml 

  pending

  #rdf_should_be_of_type_event
  rdf_should_contain_statements
  rdf_should_contain_a_label
  rdf_should_contain_a_description
  #rdf_should_contain_an_image
end

Then /^I should get valid data for each of the Event's related Articles$/ do
  pending
  # I should get all related Articles
  # I should get each related Article's title
  # I should get each related Article's URI
end

Then /^I should get valid data for each related Person$/ do
  pending
  # I should get all related People
  # I should get each related Person's name
  # I should get each related Person's description
  # I should get each related Person's thumbnail
  # I should get each related Person's profile URI
end

Then /^I should get valid data for each related Place$/ do
  pending 
  # I should get all related Place
  # I should get each related Place's name
  # I should get each related Place's latitude
  # I should get each related Place's longitude
end

Then /^I should get valid data for each related Programme$/ do
  pending 
  # I should get all related Programmes
  # I should get each related Programme's title
  # I should get each related Programme's URI
  # I should get each related Programme's thumbnail
end

Then /^I should get valid data for each of the Person's related Articles$/ do
  pending 
  # I should get all related Articles
  # I should get each related Article's title
  # I should get each related Article's URI
end


