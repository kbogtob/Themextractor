require 'rgl/adjacency'
require 'dbpedia'
require 'rgl/dot'

module ThemeExtractor
    attr_reader :graph
    
    class GraphBuilder
        def initialize(resource_uris)
            @graph = RGL::DirectedAdjacencyGraph.new()
            
            # foreach resource uris
            resource_uris.each do |uri|
                # get the nearest subjects
                subjects = DBpedia::get_subjects_uri(uri)
                
                # add them all to the graph
                @graph.add_vertex(uri.to_s)
                
                # add the vertices for the subjects and their relation to the resource uri
                subjects.each do |subject|
                    @graph.add_vertex(subject[:uri].to_s)
                    @graph.add_edge(uri.to_s, subject[:uri].to_s)
                end
                
                # foreach subject, get its broaders
                subjects.each do |subject|
                    broaders = DBpedia::get_broader_uri(subject[:uri])
                    #foreach broader, add its vertex and edge from the subject to it
                    broaders.each do |broader|
                        @graph.add_vertex(broader[:uri].to_s)
                        @graph.add_edge(subject[:uri].to_s, broader[:uri].to_s)
                    end
                end
            end
        end
    end
end