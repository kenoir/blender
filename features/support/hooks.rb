Before do
  @stub_request = stub_juicer_rdf_event_endpoint
end

After do
  clear_stub_requests
end
