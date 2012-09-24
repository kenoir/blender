Feature: Blender service
	As a service consumer
	I want to receive RDF XML that describes a specific resource
	In order to undertand the relationship between the resource and others
	
	Scenario: Requesting an RDF resource
	  When I request a RDF resource URI
	  Then I will get valid RDF XML back
	
	 
	
