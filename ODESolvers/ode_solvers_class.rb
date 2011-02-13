require './equation.rb'

class ODESolvers

    # Variables which can be read/written by methods in this class
    # but only read externally.
    attr_reader :xn, :yn

    def initialize(inputs)
        @x0 = inputs.x0
        @y0 = inputs.y0
        @stepsize = inputs.stepsize
        @steps = inputs.steps
        @printOut = inputs.printOut
        @xn = 0.0
        @yn = 0.0
    end

    def eulerMethod
        @xn = @x0
        @yn = @y0
        for n in 0..@steps-1 do
            printIntermediateSteps(n)
            k1 = function(@xn,@yn)
            @yn += @stepsize*k1
            @xn += @stepsize
        end
    end

    def modifiedEulerMethod
        @xn = @x0
        @yn = @y0
        for n in 0..@steps-1 do
            printIntermediateSteps(n)
            k1 = @stepsize*function(@xn,@yn)
            @xn += @stepsize
            k2 = @stepsize*function(@xn,@yn+k1)   
            @yn += 0.5*(k1+k2)
        end
    end

    def rk4Method
        @xn = @x0
        @yn = @y0
        for n in 0..@steps-1 do
            printIntermediateSteps(n)
            k1 = @stepsize*function(@xn,@yn)
            k2 = @stepsize*function(@xn+0.5*@stepsize,@yn+0.5*k1)   
            k3 = @stepsize*function(@xn+0.5*@stepsize,@yn+0.5*k2)
            k4 = @stepsize*function(@xn+@stepsize,@yn+k3)
            @xn += @stepsize
            @yn += (1.0/6.0)*(k1+2.0*k2+2.0*k3+k4)
        end
    end

    def printIntermediateSteps(n)
        if @printOut=="y"
          print "Step(#{n}), x = #{xn}, y = #{yn}\n"
        end
    end

    # These methods cannot be called externally.
    private :printIntermediateSteps

end
