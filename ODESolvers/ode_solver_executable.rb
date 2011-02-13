#----------------------------------------------------#
# Numerical Solutions of ODEs.
# Laurence R. McGlashan
# 12th February 2011
# lrm29@cam.ac.uk
#----------------------------------------------------#

# Load solvers, inputs and outputs.
require './ode_solvers_class.rb'
require './inputs_class.rb'
require './outputs_class.rb'

#----------------------------------------------------#

# Create output and input classes.
outputs = Outputs.new
inputs = Inputs.new

# Print a header.
outputs.printHeader

# Get user inputs.
inputs.getInputs

# Create the solver class.
solvers = ODESolvers.new(inputs)

#----------------------------------------------------#

puts "\nEuler's Method | Start: x = #{inputs.x0}, y = #{inputs.y0}\n"
solvers.eulerMethod
puts "Euler's Method | End: x = #{solvers.xn}, y = #{solvers.yn}"

#----------------------------------------------------#

puts "\nModified Euler's Method | Start: x = #{inputs.x0}, y = #{inputs.y0}\n"
solvers.modifiedEulerMethod
puts "Modified Euler's Method | End: x = #{solvers.xn}, y = #{solvers.yn}"

#----------------------------------------------------#

puts "\nFourth Order Runge-Kutta Method | Start: x = #{inputs.x0}, y = #{inputs.y0}\n"
solvers.rk4Method
puts "Fourth Order Runge-Kutta Method | End: x = #{solvers.xn}, y = #{solvers.yn}"

outputs.exit
