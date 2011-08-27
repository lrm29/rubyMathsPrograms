class NR_squareroot

    attr_reader :rubyRootx, :standardRootx, :inverseRootx, :secantRootx

    def initialize(number, x0, nsteps)
        @number = number
        @x0 = x0
        @nsteps = nsteps
    end 

    def rubyRoot
        for n in 0..@nsteps do
            @rubyRootx = Math.sqrt(@number)   
        end    
    end

    def standard
        @standardRootx = @x0
        for n in 0..@nsteps do
            @standardRootx = 0.5*(@standardRootx + @number/@standardRootx)
        end
    end

    def inverse
        @inverseRootx = @x0
        for n in 0..@nsteps do
            @inverseRootx = 0.5*@inverseRootx*(3.0 - @number*@inverseRootx*@inverseRootx)
        end
        @inverseRootx = 1.0/@inverseRootx
    end

    def secantMethod
        @oldValue = @x0*2.0
        @secantRootx = @x0
        for n in 0..@nsteps do
            @secantRootNew = @secantRootx - \
                            (@secantRootx*@secantRootx-@number)*(@secantRootx-@oldValue) \
                            /((@secantRootx*@secantRootx-@number)-(@oldValue*@oldValue-@number)+1e-12) 
            @oldValue = @secantRootx
            @secantRootx = @secantRootNew
        end
    end

end
