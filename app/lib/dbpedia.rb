require 'dbpedia/client'

module DBpedia
    SUBJECT_URI = 'http://purl.org/dc/terms/subject'
    BROADER_URI = 'http://www.w3.org/2004/02/skos/core#broader'
    LABEL_URI = 'http://www.w3.org/2000/01/rdf-schema#label'
    
    CLIENT = DBpedia::Client.new()
    
    def self.get_resource_uri(wiki_link)
        
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
    
    def self.get_resource_label(resource_uri)
        CLIENT.getResource(resource_uri, {
            label: LABEL_URI
        })
    end
end