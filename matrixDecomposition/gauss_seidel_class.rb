# Gauss Seidel class
class GaussSeidel

    # Solve the linear system Ax=b. 
    #
    # Inputs:
    # matrix = A
    # rhs = b
    # iterations = Number of iterations to run
    #
    # Output:
    # Solution matrix
    def solve(matrix,rhs,iterations)

        solution = Matrix[[0.0],[0.0],[0.0]]
        n = matrix.row_size-1
        count = 0

        while count < iterations

            for i in (0..n)

                solution[i,0] = rhs[i,0]

                for j in (0..i-1)
                    solution[i,0] -= matrix[i,j]*solution[j,0] 
                end

                for j in (i+1..n)
                    solution[i,0] -= matrix[i,j]*solution[j,0] 
                end

                solution[i,0] /= matrix[i,i]

            end

            count += 1

        end

        return solution

    end

end
