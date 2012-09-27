class IndexController
  
  attr :rdf_wrapper
  
  def initialize(resource_uri)
  	@rdf_wrapper = RDFWrapper.new(resource_uri)  	
  end
  
  def run!
  	@rdf_wrapper.getData  	    
  end

end
