require './app'
require 'rack/test'
require 'rdf'
require 'rdf/rdfxml'
require 'rest_client'
require 'pp'

require_relative '../rest-assured/helpers.rb'

include RestAssuredHelpers
include RDF

#start_test_api

def dummy_rest_client
  if defined? @dummy_rest_client 
    return @dummy_rest_client 
  end

  dummy_response = double('response')
  dummy_response.stub(:to_str).and_return(event_rdf_resource)

  
  @dummy_rest_client = double('RestClient')
  @dummy_rest_client.stub(:get).and_return(dummy_response)

  @dummy_rest_client
end


def app
  Application 
end