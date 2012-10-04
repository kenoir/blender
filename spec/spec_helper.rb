require 'simplecov'

require './app'
require 'rack/test'
require 'webmock/rspec'
require 'rdf'
require 'rdf/rdfxml'
require 'pp'

require_relative '../models/rdf_loader.rb'
require_relative '../webmock/helpers.rb'

include WebmockHelpers
include RDF

def app
  Application 
end

def mock_loader
  rdfLoaderMock = mock(RDFLoader)
  rdfLoaderMock.stub(:get_data).and_return(stub_event_rdf)
  rdfLoaderMock
end
