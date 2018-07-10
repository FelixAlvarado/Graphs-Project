require_relative 'graph'

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


