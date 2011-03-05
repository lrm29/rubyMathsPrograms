require 'matrix.rb'

matrix = Matrix[[1, 1, 1],[1, 1, 3],[1, 3, 5]]

puts "Input Matrix:"
puts matrix

n = (matrix.row_size())

for k in 0..(n-1)
    for x in (k+1)..n
        matrix[x,k] = matrix[x,k] / matrix[k,k]
    end
    for i in (k+1)..n
        for j in (k+1)..n
            matrix[i,k] = matrix[i,j] - matrix[i,k]*[k,j]
        end
    end
end

puts matrix
