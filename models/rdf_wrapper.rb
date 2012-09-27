class RDFWrapper

	attr :uri
	
	def initialize(uri)
		@uri = uri	
	end
	
	def getData
		return IO.read(@uri)
	end

end