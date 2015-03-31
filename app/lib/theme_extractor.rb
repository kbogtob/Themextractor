require 'textrazor'
require 'sinatra'

module ThemeExtractor
	# parse the text, extract the entities and remove the duplicates
	def self.parse(api_key, text)
		entities = TextRazor.parse_entities(api_key, text)
		entities.uniq { |entity| entity.entity_id }
	end

	# from the entities in themes, returns the related themes and their scores
	def self.findTheme(themes)

	end
end