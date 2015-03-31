require 'textrazor'
require 'sinatra'
require 'theme_extractor/graph_builder'

module ThemeExtractor
	# parse the text, extract the entities and remove the duplicates
	def self.parse(api_key, text)
		entities = TextRazor.parse_entities(api_key, text)
		entities.uniq { |entity| entity.entity_id }
	end

	# from the entities in entities, returns the related themes and their scores
	def self.findTheme(entities)
		resource_uris = entities.map do |entity|
			DBpedia::get_resource_uri(entity.wiki_link)
		end
		
		graph = ThemeExtractor::GraphBuilder.new(resource_uris).graph
		weighter = ThemeExtractor::WeightCalculator.new(graph)
		
	end
end