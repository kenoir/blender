Before('@juicer_event') do
	stub_rdf_endpoint(juicer_rdf_event_endpoint,stub_event_rdf)  
end

After do
  clear_stub_requests
end
