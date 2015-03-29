require 'textrazor/client'

module TextRazor
	def self.parse_entities(api_key, text)
		client = TextRazor::Client.new(api_key)
		client.analyze(text).entities
	end
end