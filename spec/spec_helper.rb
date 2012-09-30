require './app'
require 'rack/test'
require 'webmock/rspec'
require 'rdf'
require 'rdf/rdfxml'
require 'pp'

require_relative '../webmock/helpers.rb'
include WebmockHelpers

include RDF

def app
  Application 
end