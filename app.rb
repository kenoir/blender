require 'sinatra'
require 'sinatra/base'
require 'yaml'
require 'dalli'

Dir.glob("controllers/*.rb").each { |r| require_relative r }
Dir.glob("mixin/*.rb").each { |r| require_relative r }
Dir.glob("models/*.rb").each { |r| require_relative r }

class Application < Sinatra::Base
  set :logging, :true
  set :cache, Dalli::Client.new(
    ENV['MEMCACHE_SERVERS'], 
    :username => ENV['MEMCACHE_USERNAME'], 
    :password => ENV['MEMCACHE_PASSWORD'], 
    :expires_in => 3600)

  set :config, Proc.new {
    full_yaml_config = YAML.load_file("config/application.yml")
    full_yaml_config[Application.environment.to_s]
  }

  get '/rdf' do
    index_controller = IndexController.new
    @rdfxml = index_controller.run!
  end

end
