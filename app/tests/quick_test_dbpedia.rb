$LOAD_PATH << './lib'

require 'pp'
require 'dbpedia/client'
require 'dbpedia'

class Entity
    attr_accessor :id, :wiki_link
    def initialize (id, wiki_link)
        @id = id
        @wiki_link = wiki_link
        @dbpedia_ressource= wiki_link.gsub('http://en.wikipedia.org/wiki', 'http://dbpedia.org/resource')
    end
end

entities = [
    Entity.new('Nicolas Sarkozy', 'http://fr.wikipedia.org/wiki/Nicolas_Sarkozy'),
    Entity.new('François Hollande', 'http://fr.wikipedia.org/wiki/Francois_Hollande'),
    Entity.new('Jacques Chirac', 'http://fr.wikipedia.org/wiki/Jacques_Chirac'),
    Entity.new('Paris', 'http://fr.wikipedia.org/wiki/Paris')
]

client = DBpedia::Client.new();

subjects = client.getResource('http://dbpedia.org/resource/Nicolas_Sarkozy', {
   label: 'http://purl.org/dc/terms/subject',
});

broaders = client.getResource(subjects.first[:label], {
   broader: 'http://www.w3.org/2004/02/skos/core#broader'
});

DBpedia::get_subjects_uri('http://dbpedia.org/resource/Nicolas_Sarkozy')
p DBpedia::get_resource_uri(entities[1].wiki_link)