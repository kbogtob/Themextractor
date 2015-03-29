require 'json'
require 'textrazor/entity'

module TextRazor
	class Response

	    BadRequest = Class.new(StandardError)
	    Unauthorised = Class.new(StandardError)
	    RequestEntityTooLong = Class.new(StandardError)

	    attr_reader :raw_response, :entities

	    def initialize(http_response)
	      code = http_response.code
	      body = http_response.body

	      raise BadRequest.new(body) if code == 400
	      raise Unauthorised.new(body) if code == 401
	      raise RequestEntityTooLong.new(body) if code == 413

	      @raw_response = ::JSON.parse(body)["response"]
	    end

	    def entities
			raw_entities = raw_response["entities"]
			return nil if raw_entities.nil?

			@entities ||= begin
				raw_entities.map do |entity_hash|
					Entity.create_from_hash(entity_hash)
					end
			end
		end
	end
end
