require 'matrix.rb'

class Matrix

  # Assign the given value to the slot at the specified row and column
  def []=(row, column, value)
    @rows[row][column] = value
  end

  def to_s
    [sprintf("%d x %d Matrix", @rows.length, column_size),
      @rows.map { |row| row.inspect }].flatten.join("\n")
  end

end

matrix = Matrix[[1, 1, 1],[1, 1, 3],[1, 3, 5]]
L = Matrix.zero(3)
U = Matrix.zero(3)

puts "Input Matrix:"
puts matrix

n = (matrix.row_size())-1

for k in 0..(n-1)
    for x in (k+1)..n
        #L[x,k]=matrix[x,k]/matrix[k,k]
        matrix[x,k]=matrix[x,k]/matrix[k,k]
    end
    for i in (k+1)..n
        for j in (k+1)..n
            #U[i,k]=matrix[i,j]-matrix[i,k]*matrix[k,j]
            matrix[i,k]=matrix[i,j]-matrix[i,k]*matrix[k,j]
        end
    end
end

puts matrix

print "\nHit <Enter> to Exit."
STDIN.gets