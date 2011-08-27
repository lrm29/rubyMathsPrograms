# Class for outputting to screen.
class Outputs

    # Print a header.
    def printHeader
        print "---------------------------\n"
        print "Linear Algebra Routines\n"
        print "Laurence R. McGlashan\n"
        print "13th February 2011\n"
        print "lrm29@cam.ac.uk\n"
        print "---------------------------\n\n"
    end

    # Exit program after user input.
    def exit
        print "\nHit <Enter> to Exit."
        STDIN.gets
    end

    # Print to screen the content of [].
    def [](out)
        puts out
    end

end
