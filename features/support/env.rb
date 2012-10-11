require 'simplecov'

require 'rspec'
require 'webmock/cucumber'
require 'rack/test'
require 'rest-client'
require 'rdf'
require 'rdf/rdfxml'


require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')
require File.join(File.dirname(__FILE__), '..', '..', 'webmock','helpers.rb')
require File.join(File.dirname(__FILE__), 'blender_helpers.rb')

include RDF
include WebmockHelpers

World(WebMock::API, WebMock::Matchers)
World(BlenderHelpers)

class ApplicationWorld
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  def app
    @app = Rack::Builder.new do
      run Application
    end
  end    

  include Rack::Test::Methods

  ApplicationWorld.new
end


