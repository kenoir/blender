Feature: Blender service
  As a service consumer
  I want to receive RDF XML that describes a specific resource
  In order to undertand the relationship between the resource and others

  Scenario: Requesting a RDF resource
    When I request
      """
      /rdf?identifier=#{event_uri}
      """
    Then I should get valid RDF back

  Scenario: Requesting an Event
    When I request 
      """
      /event/#{event_id}
      """
    Then I should get valid Event data

  Scenario: Requesting a list of Articles related to an Event
    When I request
      """
      /event/#{event_id}/articles
      """
    Then I should get valid data for each of the Event's related Articles

  Scenario: Requesting a list of People related to an Event
    When I request
      """
      /event/#{event_id}/people
      """
    Then I should get valid data for each related Person

  Scenario: Requesting a list of Places related to an Event
    When I request
      """
      /event/#{event_id}/places
      """
    Then I should get valid data for each related Place  

  Scenario: Requesting a list of Programmes related to an Event
    When I request
      """
      /event/#{event_id}/programmes
      """
    Then I should get valid data for each related Programme

  Scenario: Requesting an Articles list for a Person who is related to an Event
    When I request
      """
      /event/#{event_id}/people/#{person_id}/articles
      """
    Then I should get valid data for each of the Person's related Articles

