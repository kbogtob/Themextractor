require 'sparql/client'
module DBpedia
    class Client
        ENDPOINT_URL = "http://dbpedia.org/sparql"
        
        def initialize()
            @client = SPARQL::Client.new(ENDPOINT_URL)
        end
        
        def getResource(ressource_uri, properties)
            result = []
            labels = properties.keys
            
            query = "select ?" + labels.map { |label| label }.join(" ?") + "\n"
            query += "where { <" + ressource_uri + ">\n"
            query += labels.map { |label| '<' + properties[label] + "> ?" + label.to_s}.join(" ;\n")
            query += "\n}"
            
            solutions = @client.query(query)
            solutions ||= []
            
            solutions.map do |solution|
                result = {}
                labels.each { |label| result[label] = solution[label.to_sym] }
                result
            end
        end
    end
end