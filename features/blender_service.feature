Feature: Blender service
	As a service consumer
	I want to receive RDF XML that describes a specific resource
	In order to undertand the relationship between the resource and others
	  
	Scenario: Making a request
	  When I make a request
	  Then I should get a successful response
	
	Scenario: Requesting an RDF resource
	  When I request a RDF resource URI
	  Then I should get valid RDF XML back
	
	Scenario: Requesting an Event RDF resource
	  When I request an Event RDF resource URI
	  Then I should get an Event RDF XML data
	  Then I should get an Event name
	  Then I should get an Event description
	
	
	 
	
