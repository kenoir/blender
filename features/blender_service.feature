Feature: Blender service
  As a service consumer
  I want to receive RDF XML that describes a specific resource
  In order to undertand the relationship between the resource and others

  @juicer_event_rdfxml
  Scenario: Requesting a RDF resource
    When I request
    """
    /rdf?identifier=#{event_uri}
    """
    Then I should get valid RDF back

  @juicer_article_rdfxml 
  @juicer_article_json
  Scenario: Requesting an Article
    When I request
    """
    /articles/#{article_id}
    """
    Then I should get valid Article data

  @juicer_event_rdfxml
  Scenario: Requesting an Event
    When I request 
    """
    /events/#{event_id}
    """
    Then I should get valid Event data

  Scenario: Requesting a Person
    When I request 
    """
    /people/#{dbpedia_id}
    """
    Then I should get valid Person data

  Scenario: Requesting a Place 
    When I request 
    """
    /places/#{dbpedia_id}
    """
    Then I should get valid Place 
