When /^I make a request$/ do
	visit '/rdf?identifier=http://someresource'
end

Then /^I should get a successful response$/ do
	response_should_be_valid
end


When /^I request a RDF resource URI$/ do
	visit '/rdf?identifier=http://someresource'
end

Then /^I should get valid RDF back$/ do  
	data_should_be_valid_rdf_xml 
end


When /^I request an Event's resource URI$/ do
	visit '/rdf?identifier=http://juicer.responsivenews.co.uk/events/18'
end

Then /^I should get valid Event data$/ do   
	rdf_should_contain_statements
	rdf_should_contain_a_label
	rdf_should_contain_a_description
	rdf_should_contain_an_image
end


When /^I request an Event's related Articles resource URI$/ do
	pending 
	# visit this end point URI
end

Then /^I should get valid data for each of the Event's related Articles$/ do
	pending
	# I should get all related Articles
	# I should get each related Article's title
	# I should get each related Article's URI
end


When /^I request an Event's related People resource URI$/ do
  pending 
  # visit this end point URI
end

Then /^I should get valid data for each related Person$/ do
	pending
	# I should get all related People
	# I should get each related Person's name
	# I should get each related Person's description
	# I should get each related Person's thumbnail
	# I should get each related Person's profile URI
end


When /^I request an Event's related Places resource URI$/ do
 	pending 
 	# visit this end point URI
end

Then /^I should get valid data for each related Place$/ do
	pending 
	# I should get all related Place
	# I should get each related Place's name
	# I should get each related Place's latitude
	# I should get each related Place's longitude
end


When /^I request an Event's related Programmes resource URI$/ do
	pending 
	# visit this end point
end

Then /^I should get valid data for each related Programme$/ do
	pending 
	# I should get all related Programmes
	# I should get each related Programme's title
	# I should get each related Programme's URI
	# I should get each related Programme's thumbnail
end


When /^I request a Person's related Articles resource URI$/ do
	pending 
	# visit this end point
end

Then /^I should get valid data for each of the Person's related Articles$/ do
	pending 
	# I should get all related Articles
	# I should get each related Article's title
	# I should get each related Article's URI
end


