require 'matrix_decomposition_class.rb'
require 'gauss_seidel_class.rb'
require 'outputs_class.rb'

outputs = Outputs.new
outputs.printHeader

# Input matrix.
matrix = Matrix[
  [1.0,1.0,1.0],
  [1.0,3.0,3.0],
  [1.0,3.0,5.0]
]

# Right hand side of the linear system.
lrhs = Matrix[[2.0],[0.0],[2.0]]

outputs["Input Matrix:"]
outputs[matrix]

# Create the LU decomposition class, giving it the input matrix.
lu = LU.new(matrix)
# Create the gauss seidel solver
gs = GaussSeidel.new

outputs["\nOutput Matrix L:"]
outputs[lu.L]
outputs["\nOutput Matrix U:"]
outputs[lu.U]

# Solve L.f = b 
urhs = gs.solve(lu.L,lrhs,10)
# Solve U.x = f
solution = gs.solve(lu.U,urhs,10)


outputs["\nThe solution is: "]
outputs[solution]

# Output the number of operations for the decomposition.
outputs["\nNumber of operations to decompose the matrix = #{lu.count}"]

# Exit. Waits for keyboard input.
outputs.exit
