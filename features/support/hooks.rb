Before() do
  stub_endpoint(juicer_rdf_event_endpoint,stub_event_rdf,'application/rdf+xml')  
  stub_endpoint(juicer_json_event_endpoint,stub_event_json,'application/json')  
  stub_endpoint(juicer_json_article_endpoint,stub_article_json,'application/json')
  stub_endpoint(juicer_rdfxml_article_endpoint,stub_article_rdfxml,'application/rdf+xml')
  stub_endpoint(incubator_rdf_identifier_endpoint,stub_dummy_rdfxml,'application/rdf+xml')
  stub_endpoint(incubator_rdf_place_endpoint,stub_dummy_rdfxml,'application/rdf+xml')
  stub_endpoint(incubator_rdf_agent_endpoint,stub_dummy_rdfxml,'application/rdf+xml')
  stub_endpoint(juicer_rdf_identifier_endpoint,stub_dummy_rdfxml,'application/rdf+xml')
end

After do |scenario|
    if scenario.failed?
      write_location = File.join(File.dirname(__FILE__),'..','..','features','target','failed',"#{scenario.to_sexp[3].tr_s(' ','_').downcase}.html")

      last_response_body = last_response.body
      html_file = File.new(write_location, "w")
      html_file.write(last_response_body)
      html_file.close
    end
end
