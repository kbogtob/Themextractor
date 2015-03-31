require 'rgl/adjacency'
require 'rgl/dot'

module ThemeExtractor
    # This class computes the centrality of vertices on a RGL::DirectedEdgeGraph
    # using methods from the kanopy framework
    class WeightCalculator
        FOCUSED_CLOSENESS_CENTRALITY = 1
        FOCUSED_BETWEENNESS_CENTRALITY = 2
        FOCUSED_INFORMATION_CENTRALITY = 4
        FOCUSED_RANDOM_WALK_BETWEENNESS_CENTRALITY = 8
        
        def initialize(graph)
            @graph = graph
        end
        
        # method using the parameter to define with which centrality we're going
        # to weighten the graph
        def weighten(method)
            if method == FOCUSED_CLOSENESS_CENTRALITY
                fcc
            elsif method == FOCUSED_BETWEENNESS_CENTRALITY
                fbc
            elsif method == FOCUSED_INFORMATION_CENTRALITY
                fic
            elsif method == FOCUSED_RANDOM_WALK_BETWEENNESS_CENTRALITY
                frwbc
            else
                {}
            end
        end
        
        private
        def fcc
            concepts = {}
        end
        
        def fbc
            concepts = {}
        end
        
        def fic
            concepts = {}
        end
        
        def frwbc
            concepts = {}
        end
    end
end