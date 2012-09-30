When /^I make a request$/ do
	visit '/rdf?identifier=http://someresource'
end

Then /^I should get a successful response$/ do
	response_should_be_valid
end


When /^I request a RDF resource URI$/ do
	visit '/rdf?identifier=http://someresource'
end

Then /^I should get valid RDF XML back$/ do  
	data_should_be_valid_rdf_xml 
end


When /^I request an Event RDF resource URI$/ do
	visit '/rdf?identifier=http://juicer.responsivenews.co.uk/events/18'
end

Then /^I should get an Event RDF XML data$/ do   
	rdf_should_contain_statements 
end

Then /^I should get an Event name$/ do
	rdf_should_contain_a_label	
end

Then /^I should get an Event description$/ do
	rdf_should_contain_a_description
end


