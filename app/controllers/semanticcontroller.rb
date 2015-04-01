require 'json'
require 'theme_extractor'

class Application < Sinatra::Base
	post '/parse', :provides => :json do
		pass unless request.accept? 'application/json'
		begin 
			json = JSON.parse(request.body.read)
			rescue JSON::ParserError
				status 400
				body 'JSON request invalid.'
				return
		end
		
		if json['text'].nil? || json['nb_concepts'].nil?
			status 400
			body 'JSON request invalid.'
			return
		end
		
#		# just returning the entities in the mean time 
#		# of actually developing the business part
#		
#		concepts = []
#		entities = ThemeExtractor::parse(settings.textrazor_api_key, json['text'])
#
#		entities.each do |entity|
#			concepts.push({name: entity.entity_id, score: rand(1..10)})
#		end
		concepts_gotten = ThemeExtractor::get_concepts(settings.textrazor_api_key, json['text'], json['nb_concepts'].to_i)
		JSON.generate({
			'concepts' => concepts_gotten
		})
	end
end