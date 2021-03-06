require 'dbpedia/client'

module DBpedia
    RESSOURCE_BASE_URI = 'http://dbpedia.org/resource/'
    
    SUBJECT_URI = 'http://purl.org/dc/terms/subject'
    BROADER_URI = 'http://www.w3.org/2004/02/skos/core#broader'
    LABEL_URI = 'http://www.w3.org/2000/01/rdf-schema#label'
    
    CLIENT = DBpedia::Client.new()
    
    def self.get_resource_uri(wiki_link)
        RDF::URI.new(RESSOURCE_BASE_URI + wiki_link.gsub(/.*\/(?<res>.*)/, '\k<res>'))
    end
    
    def self.get_subjects_uri(resource_uri)
        CLIENT.getResource(resource_uri, {
           uri: SUBJECT_URI,
        })
    end
    
    def self.get_broader_uri(resource_uri)
        CLIENT.getResource(resource_uri, {
            uri: BROADER_URI
        })
    end
    
    def self.get_resource_label(resource_uri, lang)
        CLIENT.getResource(resource_uri, {
            label: LABEL_URI
        }).reject { |literal| literal[:label].language != lang.to_sym }
    end
    
    def self.get_resources_similar_subjects_uri(resource_a, resource_b)
        CLIENT.getSimilarRessource(resource_a, resource_b, SUBJECT_URI)
    end
end