class IndexController
  
  attr_accessor :rdf_loader, :resource_uri
  
  def initialize(uri)
  	@resource_uri = uri
  	@rdf_loader = RDFLoader.new(@resource_uri)
  end
  
  def run!
  	rdf_data = @rdf_loader.getData
  end

end
