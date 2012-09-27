class IndexController
  
  attr :rdf_wrapper
  
  def initialize
  	@rdf_wrapper = RDFWrapper.new(request.request_uri)  	
  end
  
  def run!
  	@rdf_wrapper.getData  	    
  end

end