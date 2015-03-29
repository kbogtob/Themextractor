require 'rest_client'

module TextRazor
	class Request
		HTTPS_URL = 'https://api.textrazor.com/'

		OPTIONS_MAPPING = {
			extractors: 'extractors',
			cleanup_html: 'cleanupHTML',
			language: 'languageOverride',
			filter_dbpedia_types: 'entities.filterDbpediaTypes',
			filter_freebase_types: 'entities.filterFreebaseTypes'
		}

		def self.post(text, options)
			::RestClient.post(HTTPS_URL, build_query(text, options), accept_encoding: 'gzip')
		end

		private

		def self.build_query(text, options)
			query = {
				"text" => text, 
				"apiKey" => options.delete(:api_key)
			}

			options.each do |key, value|
				value = value.join(",") if value.is_a?(Array)
				query[OPTIONS_MAPPING[key]] = value
			end

			query
		end
	end
end
