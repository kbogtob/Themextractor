require 'textrazor/util'

module TextRazor
	class Entity
	    attr_reader :id, :type, :matching_tokens, :entity_id, :freebase_types, :confidence_score,
	      :wiki_link, :matched_text, :freebase_id, :relevance_score, :entity_english_id,
	      :starting_pos, :ending_pos

	    def initialize(params = {})
	      @type = []
	      params.each do |k, v|
	        instance_variable_set(:"@#{k}", v) if v && self.respond_to?(:"#{k}")
	      end
	    end

	    def self.create_from_hash(params)
	      params = Hash[params.map {|k, v| [standardize(k), v] }]
	      new(params)
	    end

	    private

	    def self.standardize(param)
			param.gsub(/::/, '/').
			gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
			gsub(/([a-z\d])([A-Z])/,'\1_\2').
			tr("-", "_").
			downcase
		end
	end
end