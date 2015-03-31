$LOAD_PATH << './lib'

require 'pp'
require 'dbpedia/client'
require 'dbpedia'
require 'textrazor'
require 'theme_extractor'

api_key = "d8935a5a2a3ee2ccd2ffdf82ca77bcba3bb3543196a4125dff2d0469"
text = 'Nicolas Sarkozy, Jean Marie Le Pen et Jacques Chirac se sont rencontrés à Paris.'

entities = TextRazor::parse_entities(api_key, text)

resources = []

entities.each do |entity|
    resources.push(DBpedia::get_resource_uri(entity.wiki_link))
end

ThemeExtractor::findTheme(entities)


