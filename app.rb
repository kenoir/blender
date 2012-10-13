require 'sinatra'
require 'sinatra/base'
require 'yaml'
require 'dalli'

Dir.glob("controllers/*.rb").each { |r| require_relative r }
Dir.glob("mixin/*.rb").each { |r| require_relative r }
Dir.glob("models/*.rb").each { |r| require_relative r }

class Application < Sinatra::Base
  set :env, ENV['RACK_ENV']
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

  set :controller, Proc.new {
    ResourceController.new
  }

  get '/rdf' do
    id = params["identifier"]
    @rdfxml = Application.controller.get(:identifier,id)
  end

  get '/events/:id' do | id |
    @rdfxml = Application.controller.get(:event,id)
  end

  get '/articles/:id' do | id |
    @rdfxml = Application.controller.get(:article,id)
  end

  get '/people/:id' do | id |
    @rdfxml = Application.controller.get(:people,id)
  end

  get '/places/:id' do | id |
    @rdfxml = Application.controller.get(:places,id)
  end

end
