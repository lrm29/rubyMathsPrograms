require './newton_raphson_class.rb'
require 'benchmark'

# Number of steps.
nsteps=1000000
# Starting Value.
x0=1
# Number to take the square root of.
number=2

nrsq = NR_squareroot.new(number,x0,nsteps)

puts "Take the square root of #{number} using the Newton-Raphson method."
puts "Compare the performance of different methods in a loop of #{nsteps} iterations."

Benchmark.bm(30) do |x|
  x.report("Ruby.sqrt") {nrsq.rubyRoot}
  x.report("Newton-Raphson Standard Method") {nrsq.standard}
  x.report("Newton-Raphson Inverse Method") {nrsq.inverse}
  x.report("Secant Method") {nrsq.secantMethod}
end

puts "Ruby Root = #{nrsq.rubyRootx}"
puts "Standard Root = #{nrsq.standardRootx}"
puts "Inverse Root = #{nrsq.inverseRootx}"
puts "Root From Secant = #{nrsq.secantRootx}"

puts "\nThe Inverse method should be faster than the Standard method!"
