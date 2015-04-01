$LOAD_PATH << './lib'

require 'pp'
require 'dbpedia/client'
require 'dbpedia'

class Entity
    attr_accessor :id, :wiki_link
    def initialize (id, wiki_link)
        @id = id
        @wiki_link = wiki_link
    end
end

entities = [
    Entity.new('Nicolas Sarkozy', 'http://fr.wikipedia.org/wiki/Nicolas_Sarkozy'),
    Entity.new('François Hollande', 'http://fr.wikipedia.org/wiki/Fran&ccedil;ois_Hollande'),
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
DBpedia::get_resource_uri(entities[1].wiki_link)

DBpedia::get_resource_label(DBpedia::get_resource_uri(entities[1].wiki_link), 'en')

p client.getSimilarRessource(DBpedia::get_resource_uri(entities[0].wiki_link), 
DBpedia::get_resource_uri(entities[2].wiki_link), 
'http://purl.org/dc/terms/subject')

