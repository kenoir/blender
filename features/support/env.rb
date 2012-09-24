require 'capybara'
require 'capybara/cucumber'
require 'rest-assured'
require 'rspec'
require 'rest-client'
require 'rdf'
require 'rdf/rdfxml'

include RDF

require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')

Capybara.app = Application

class ApplicationWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ApplicationWorld.new
end
