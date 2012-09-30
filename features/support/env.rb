require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'webmock/rspec'
require 'rest-client'
require 'rdf'
require 'rdf/rdfxml'

require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')
require File.join(File.dirname(__FILE__), '..', '..', 'webmock','helpers.rb')
require File.join(File.dirname(__FILE__), 'blender_helpers.rb')

include WebmockHelpers
World(WebMock::API, WebMock::Matchers)
WebMock.allow_net_connect!

World(BlenderHelpers)

Capybara.app = Application

class ApplicationWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ApplicationWorld.new
end
