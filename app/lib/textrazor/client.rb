require 'textrazor/response'
require 'textrazor/request'

module TextRazor
	class Client
	 	EmptyApiKey = Class.new(StandardError)
		EmptyText = Class.new(StandardError)
		TextTooLong = Class.new(StandardError)

		DEFAULT_EXTRACTORS = [
			'entities', 'topics', 'words', 'phrases', 'dependency-trees',
          	'relations', 'entailments', 'senses'
		]

		REQUEST_OPTIONS = [
			:extractors, :cleanup_html, :language, 
           	:filter_dbpedia_types, :filter_freebase_types
		]

		def initialize(api_key)
			if api_key.nil? || api_key.empty?
				raise EmptyApiKey.new("API key is either nil or empty")
			end

			@api_key = api_key

			@request_options = {  }
		end

		def analyze(text)
			
			options = {
				api_key: @api_key,
				extractors: DEFAULT_EXTRACTORS
			}

			Response.new(Request.post(text, options))
		end
	end
end