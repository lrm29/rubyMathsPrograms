require 'matrix.rb'

# Extend the matrix class.
class Matrix

  # Assignment operator
  def []=(row, column, value)
      @rows[row][column] = value
  end

  # Make the matrix more aesthetically pleasing.
  def to_s
      [@rows.collect { |row| row.inspect }].join("\n")
  end

end

# LU Class
class LU
  
  # The matrices L can be read from outside the class.
  attr_reader :L
  # The matrices U can be read from outside the class.
  attr_reader :U
  # Number of operations required to compute the decomposition.
  attr_reader :count
  # Determinant of the matrix.
  attr_reader :det
  
  # Constructor
  def initialize(matrix)
      @matrix = matrix
      @n = matrix.row_size()-1
      @count = 0
      @U = Matrix.zero(matrix.row_size())
      @L = Matrix.zero(matrix.row_size())
      @det = 0
      decompose
  end
  
  # Decompose the matrix into L and U.
  def decompose
      @count = 0    
      for k in 0..@n
          for j in (k+1)..@n
              @matrix[j,k]=@matrix[j,k]/@matrix[k,k]
              @count += 1
              for i in (k+1)..@n
                  @matrix[j,i]=@matrix[j,i]-@matrix[j,k]*@matrix[k,i]
                  @count += 1
              end
          end
      end          
      for k in 0..@n
          for j in k..@n
              @U[k,j]=@matrix[k,j]
          end
          @L[k,k]=1.0
          for j in 0..(k-1)
              @L[k,j]=@matrix[k,j]
          end
      end
  end
  
end
