require_relative('resource_loader.rb')

class IncubatorRDFLoader < ResourceLoader

  def get_person(id)
  stub = <<-dummy_data
<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF
        xmlns="http://www.w3.org/2006/time#"
        xmlns:tzont="http://www.w3.org/2006/timezone#"
        xmlns:tl="http://purl.org/NET/c4dm/timeline.owl#"
        xmlns:geo-pos="http://www.w3.org/2003/01/geo/wgs84_pos#"
        xmlns:umbel-ac="http://umbel.org/umbel/ac/"
        xmlns:time="http://www.w3.org/2006/time#"
        xmlns:sw-vocab="http://www.w3.org/2003/06/sw-vocab-status/ns#"
        xmlns:ff="http://factforge.net/"
        xmlns:olo="http://purl.org/ontology/olo/core#"
        xmlns:music-ont="http://purl.org/ontology/mo/"
        xmlns:event="http://purl.org/NET/c4dm/event.owl#"
        xmlns:dc-term="http://purl.org/dc/terms/"
        xmlns:om="http://www.ontotext.com/owlim/"
        xmlns:opencyc-en="http://sw.opencyc.org/2008/06/10/concept/en/"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:factbook="http://www.daml.org/2001/12/factbook/factbook-ont#"
        xmlns:pext="http://proton.semanticweb.org/protonext#"
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:ot="http://www.ontotext.com/"
        xmlns:foaf="http://xmlns.com/foaf/0.1/"
        xmlns:yago="http://mpii.de/yago/resource/"
        xmlns:stories="http://purl.org/ontology/stories/"
        xmlns:umbel="http://umbel.org/umbel#"
        xmlns:pkm="http://proton.semanticweb.org/protonkm#"
        xmlns:wordnet16="http://xmlns.com/wordnet/1.6/"
        xmlns:owl="http://www.w3.org/2002/07/owl#"
        xmlns:po="http://purl.org/ontology/po/"
        xmlns:gr="http://purl.org/goodrelations/v1#"
        xmlns:wordnet="http://www.w3.org/2006/03/wn/wn20/instances/"
        xmlns:opencyc="http://sw.opencyc.org/concept/"
        xmlns:wordn-sc="http://www.w3.org/2006/03/wn/wn20/schema/"
        xmlns:nytimes="http://data.nytimes.com/"
        xmlns:dbp-prop="http://dbpedia.org/property/"
        xmlns:geonames="http://sws.geonames.org/"
        xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
        xmlns:dbpedia="http://dbpedia.org/resource/"
        xmlns:oasis="http://psi.oasis-open.org/iso/639/#"
        xmlns:geo-ont="http://www.geonames.org/ontology#"
        xmlns:umbel-en="http://umbel.org/umbel/ne/wikipedia/"
        xmlns:ptop="http://proton.semanticweb.org/protontop#"
        xmlns:lingvoj="http://www.lingvoj.org/ontology#"
        xmlns:pns="http://data.press.net/ontology/stuff/"
        xmlns:pnt="http://data.press.net/ontology/tag/"
        xmlns:fb="http://rdf.freebase.com/ns/"
        xmlns:dbtune="http://dbtune.org/bbc/peel/work/"
        xmlns:psys="http://proton.semanticweb.org/protonsys#"
        xmlns:umbel-sc="http://umbel.org/umbel/sc/"
        xmlns:dbp-ont="http://dbpedia.org/ontology/"
        xmlns:pni="http://data.press.net/ontology/identifier/"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
        xmlns:ub="http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#"
        xmlns:pnc="http://data.press.net/ontology/classification/"
        xmlns:rel="http://purl.org/vocab/relationship"
        xmlns:pne="http://data.press.net/ontology/event/"
        xmlns:skos="http://www.w3.org/2004/02/skos/core#"
        xmlns:pna="http://data.press.net/ontology/asset/">
<rdf:Description rdf:about="http://dbpedia.org/resource/STUBME">
  <event:agent_in rdf:resource="http://www.bbc.co.uk/event"/>
</rdf:Description>
</rdf:RDF>
   dummy_data

   stub.sub("STUBME",id)
  end

  def get_place(id)
  stub = <<-dummy_data
<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF
        xmlns="http://www.w3.org/2006/time#"
        xmlns:tzont="http://www.w3.org/2006/timezone#"
        xmlns:tl="http://purl.org/NET/c4dm/timeline.owl#"
        xmlns:geo-pos="http://www.w3.org/2003/01/geo/wgs84_pos#"
        xmlns:umbel-ac="http://umbel.org/umbel/ac/"
        xmlns:time="http://www.w3.org/2006/time#"
        xmlns:sw-vocab="http://www.w3.org/2003/06/sw-vocab-status/ns#"
        xmlns:ff="http://factforge.net/"
        xmlns:olo="http://purl.org/ontology/olo/core#"
        xmlns:music-ont="http://purl.org/ontology/mo/"
        xmlns:event="http://purl.org/NET/c4dm/event.owl#"
        xmlns:dc-term="http://purl.org/dc/terms/"
        xmlns:om="http://www.ontotext.com/owlim/"
        xmlns:opencyc-en="http://sw.opencyc.org/2008/06/10/concept/en/"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:factbook="http://www.daml.org/2001/12/factbook/factbook-ont#"
        xmlns:pext="http://proton.semanticweb.org/protonext#"
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:ot="http://www.ontotext.com/"
        xmlns:foaf="http://xmlns.com/foaf/0.1/"
        xmlns:yago="http://mpii.de/yago/resource/"
        xmlns:stories="http://purl.org/ontology/stories/"
        xmlns:umbel="http://umbel.org/umbel#"
        xmlns:pkm="http://proton.semanticweb.org/protonkm#"
        xmlns:wordnet16="http://xmlns.com/wordnet/1.6/"
        xmlns:owl="http://www.w3.org/2002/07/owl#"
        xmlns:po="http://purl.org/ontology/po/"
        xmlns:gr="http://purl.org/goodrelations/v1#"
        xmlns:wordnet="http://www.w3.org/2006/03/wn/wn20/instances/"
        xmlns:opencyc="http://sw.opencyc.org/concept/"
        xmlns:wordn-sc="http://www.w3.org/2006/03/wn/wn20/schema/"
        xmlns:nytimes="http://data.nytimes.com/"
        xmlns:dbp-prop="http://dbpedia.org/property/"
        xmlns:geonames="http://sws.geonames.org/"
        xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
        xmlns:dbpedia="http://dbpedia.org/resource/"
        xmlns:oasis="http://psi.oasis-open.org/iso/639/#"
        xmlns:geo-ont="http://www.geonames.org/ontology#"
        xmlns:umbel-en="http://umbel.org/umbel/ne/wikipedia/"
        xmlns:ptop="http://proton.semanticweb.org/protontop#"
        xmlns:lingvoj="http://www.lingvoj.org/ontology#"
        xmlns:pns="http://data.press.net/ontology/stuff/"
        xmlns:pnt="http://data.press.net/ontology/tag/"
        xmlns:fb="http://rdf.freebase.com/ns/"
        xmlns:dbtune="http://dbtune.org/bbc/peel/work/"
        xmlns:psys="http://proton.semanticweb.org/protonsys#"
        xmlns:umbel-sc="http://umbel.org/umbel/sc/"
        xmlns:dbp-ont="http://dbpedia.org/ontology/"
        xmlns:pni="http://data.press.net/ontology/identifier/"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
        xmlns:ub="http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#"
        xmlns:pnc="http://data.press.net/ontology/classification/"
        xmlns:rel="http://purl.org/vocab/relationship"
        xmlns:pne="http://data.press.net/ontology/event/"
        xmlns:skos="http://www.w3.org/2004/02/skos/core#"
        xmlns:pna="http://data.press.net/ontology/asset/">
<rdf:Description rdf:about="http://dbpedia.org/resource/STUBME">
  <event:place rdf:resource="http://www.bbc.co.uk/place"/>
</rdf:Description>
</rdf:RDF>
   dummy_data

   stub.sub("STUBME",id)
  end
    
end
