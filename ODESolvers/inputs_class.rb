class Inputs

    # Variables which can be read/written by methods in this class
    # but only read externally.
    attr_reader :x0, :y0, :stepsize, :steps, :printOut

    def getInputs
        print "Input: x0 = "
        @x0 = gets.chomp.to_f

        print "Input: y0 = "
        @y0 = gets.chomp.to_f

        print "Input: Step Size = "
        @stepsize = gets.chomp.to_f

        print "Input: Number of Steps = "
        @steps = gets.chomp.to_f

        print "Input: Print intermediate steps to screen? (y/n) = "
        @printOut = gets.chomp
    end

end

