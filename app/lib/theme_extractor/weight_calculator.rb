require 'rgl/adjacency'
require 'rgl/dot'
require 'rgl/bellman_ford'

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
            centralities = {}
            undirected_graph = @graph.to_undirected
            edge_weights = {}
            
            # weight all the edges with the same weight
            undirected_graph.edges.each { |edge|
                src_to_tgt = [edge.source, edge.target]
                tgt_to_src = [edge.target, edge.source]
                edge_weights[src_to_tgt] = 1
                edge_weights[tgt_to_src] = 1
            }
            
            # foreach vertice
            undirected_graph.vertices.each do |vertice|
                # get the shortest paths to every vertice
                shortest_paths = undirected_graph.bellman_ford_shortest_paths(
                    edge_weights, 
                    vertice
                )
                
                # compute the average shortest path for the graph
                avg = shortest_paths
                        .values
                        .map{|path| path.size}.reduce(:+) 
                avg /= shortest_paths.values.size.to_f
                
                # compute the inverse of this average and this is the fcc score
                centralities[vertice] = 1 / avg
                puts "Centrality for #{vertice} is #{centralities[vertice]}"
            end
            
            centralities
        end
        
        def fbc
            centralities = {}
        end
        
        def fic
            centralities = {}
        end
        
        def frwbc
            centralities = {}
        end
    end
end