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
        
        def getSimilarRessource(resource_uri_a, resource_uri_b, on_tag_uri)
            query = "select distinct ?similar where {\n"
            query += "<#{resource_uri_a}> <#{on_tag_uri}> ?similar .\n"
            query += "<#{resource_uri_b}> <#{on_tag_uri}> ?similar .\n"
            query += "}"
            
            solutions = @client.query(query)
            solutions ||= []
            
            solutions.map do |solution|
                {similar: solution[:similar]}
            end
        end
    end
end