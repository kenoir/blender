require_relative('../mixin/cacheable.rb')

class ResourceLoader
  require 'rest_client'

  include Cacheable

  attr :rest_client
  attr :uri

  def initialize(rest_client = RestClient)
    if not ENV['http_proxy'].nil?
      rest_client.proxy = ENV['http_proxy']
    end
    @rest_client = rest_client 
  end

  def get(uri,headers = nil)
    response = cache( uri ) {
      @rest_client.get uri, headers
    }
  end

end
