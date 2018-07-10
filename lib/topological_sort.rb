require_relative 'graph'
require 'set'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)

    sort = []
    queue = Queue.new
    vertices.each do |vertex|
        if vertex.in_edges.empty? 
            queue.enq(vertex)
        end 
    end 
    until queue.empty? 
        edges_destroy = []
        vertex = queue.pop
        sort << vertex
        vertex.out_edges.each do |edge|
            if edge.to_vertex.in_edges.length == 1
                queue.enq(edge.to_vertex)
            end 
            edges_destroy.push(edge)
        end 
        edges_destroy.each {|edge| edge.destroy!}

    end 
  
    return sort if vertices.length == sort.length 
    []
end
# kahn's algorithm
# def topological_sort(vertices)
#     queue = []
#     order = []


#     vertices.each do |vertex|
#         queue << vertex if vertex.in_edges.empty?
#     end 
#     until queue.empty? 
#         current = queue.shift 
#         order << current 
#         current.out_edges.dup.each do |edge| 
#             to_vert = edge.to_vertex
#             queue << to_vert if to_vert.in_edges.count <= 1
#             edge.destroy!
#         end 
#     end 
#     order.length == vertices.length ? order : []
# end 

# tarjans algorithm without cycle catching
# this one doesn't pass the specss
# def topological_sort(vertices)
#     order = []
#     explored = Set.new 
#     vertices.each do |vertex|
#         dfs!(order, explored, vertex) unless explored.include?(to_vertex)
#     end

# end 

# def dfs!(order, explored, vertex) 
#     explored.add(vertex)

#     vertex.out_edges.each do |edge|
#         to_vertex = edge.to_vertex
#         dfs!(order,explored, to_vertex) unless explored.include?(vertex)
#     end 

#     order.unshift(vertex)
# end 

# tarjans with cycle catching 

# tarjans algorithm with cycle catching
# this one doesn't pass the specss
# def topological_sort(vertices)
#     order = []
#     explored = Set.new 
#     cycle = false
#     vertices.each do |vertex|
#         dfs!(order, explored, vertex,temp,  cycle) unless explored.include?(vertex)
#     end

# end 

# def dfs!(order, explored, vertex, temp,  cycle) 
#     return true if temp.include?(vertex)

#     explored.add(vertex)

#     vertex.out_edges.each do |edge|
#         to_vertex = edge.to_vertex
#         cycle = dfs!(order,explored, to_vertex,temp,  cycle) unless explored.include?(vertex)
#         return true if cycle
#     end 
#     explored.add(vertex)
#     temp.delete(vertex)
#     order.unshift(vertex)
#     false
# end 

