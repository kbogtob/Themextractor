module ThemeExtractor
	# parse the text, extract the entities and remove the duplicates
	def parse(text)
		entities = TextRazor.parse_entities(settings.textrazor_api_key, text)
		entities.uniq { |entity| entity.entity_id}
	end

	# from the entities in themes, returns the related themes and their scores
	def findTheme(themes)

	end
end