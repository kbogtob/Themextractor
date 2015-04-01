require 'textrazor'
require 'sinatra'
require 'theme_extractor/graph_builder'
require 'theme_extractor/weight_calculator'

module ThemeExtractor
	def self.get_concepts(api_key, text, nb_concepts)
		nb_concepts = 7 if nb_concepts > 7
		
		entities = self.parse(api_key, text)
		concepts = self.find_concepts(entities)
		
		concepts.sort_by {|_key, value| value}
			.last(nb_concepts)
			.map do |concept|
				concept_uri = RDF::URI.new(concept[0])
				concept_literal = DBpedia::get_resource_label(concept_uri, 'en').first
				{
					name: (!concept_literal.nil?)? concept_literal[:label].to_s : concept[0],
					score: concept[1]
				}
			end
	end
	
	# parse the text, extract the entities and remove the duplicates
	def self.parse(api_key, text)
		entities = TextRazor.parse_entities(api_key, text)
		entities.uniq { |entity| entity.entity_id }
	end

	# from the entities in entities, returns the related themes and their scores
	def self.find_concepts(entities)
		resource_uris = entities.map do |entity|
			DBpedia::get_resource_uri(entity.wiki_link)
		end
		
		graph = ThemeExtractor::GraphBuilder.new(resource_uris).graph
		weighter = ThemeExtractor::WeightCalculator.new(graph)
		weighter.weighten(ThemeExtractor::WeightCalculator::FOCUSED_CLOSENESS_CENTRALITY)
	end
end