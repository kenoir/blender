Before('@juicer_event_rdfxml') do
	stub_endpoint(juicer_rdf_event_endpoint,stub_event_rdf,'application/rdf+xml')  
end

Before('@juicer_article_json') do
  stub_endpoint(juicer_json_article_endpoint,stub_article_json,'application/json')
end

Before('@juicer_article_rdfxml') do
  stub_endpoint(juicer_rdfxml_article_endpoint,stub_article_rdfxml,'application/rdf+xml')
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
