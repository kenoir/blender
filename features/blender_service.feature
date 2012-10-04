Feature: Blender service
	As a service consumer
	I want to receive RDF XML that describes a specific resource
	In order to undertand the relationship between the resource and others
	  
	Scenario: Making a request
	  When I make a request
	  Then I should get a successful response
	
	Scenario: Requesting a RDF resource
	  When I request a RDF resource URI
	  Then I should get valid RDF back
	
	Scenario: Requesting an Event
	  When I request an Event's resource URI
	  Then I should get valid Event data
	  
	Scenario: Requesting a list of Articles related to an Event
	  When I request an Event's related Articles resource URI
	  Then I should get valid data for each of the Event's related Articles
	  
	Scenario: Requesting a list of People related to an Event
	  When I request an Event's related People resource URI
	  Then I should get valid data for each related Person
	  
	Scenario: Requesting a list of Places related to an Event
	  When I request an Event's related Places resource URI
	  Then I should get valid data for each related Place  
	  	  
	Scenario: Requesting a list of Programmes related to an Event
	  When I request an Event's related Programmes resource URI
	  Then I should get valid data for each related Programme
	  
	Scenario: Requesting a list of Articles related to a Person who is themself related to an Event
	  	When I request a Person's related Articles resource URI
	  	Then I should get valid data for each of the Person's related Articles
	  
	
	
	 
	
