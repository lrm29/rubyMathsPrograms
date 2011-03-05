require './newton_raphson_class.rb'
require 'benchmark'

# Number of steps.
nsteps=1000000
# Starting Value.
x0=1.0
# Number to take the square root of.
number=600

nrsq = NR_squareroot.new(number,x0,nsteps)

puts "Take the square root of #{number} using the Newton-Raphson method."
puts "Compare the performance of different methods in a loop of #{nsteps} iterations."

Benchmark.bm(25) do |x|
  x.report("Ruby.sqrt") {nrsq.rubyRoot}
  x.report("Newton Raphson Method") {nrsq.standard}
  x.report("Secant Method") {nrsq.secantMethod}
end

puts "Ruby Root = #{nrsq.rubyRootx}"
puts "Standard Root = #{nrsq.standardRootx}"
puts "Root From Secant = #{nrsq.secantRootx}"
