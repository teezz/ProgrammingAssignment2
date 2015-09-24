## Example:
## source("cachematrix.R")
## x <- matrix(c(1, -2, 1, 1), nrow = 2)
## a <- makeCacheMatrix(x)
## cacheSolve(a)


## The functions are an example of avoiding potentially time-consuming computations by storing 
## data in an environment that is different to a function environment - here matrices and its
## inverse are stored in the global environment. This functionality allows to access the cached 
## data even out of a function scope.
## Furthermore, the example shows how to work with setter and getter mothods.

## makeCacheMatrix is a function that stores a list of functions.
## These functions are setter and getter methods for a given matrix 'x' 
## and its inverse 'xi'. Their return values will be used in the cacheSolve function.
## The '<<-' value is equivalent to method assign(x, y, envir = .GlobalEnv)
## and assigns 'x' and its inverse to the global environment (environment out of the function scope)!

makeCacheMatrix <- function(x = matrix()) {
        xi <- NULL
  
        set <- function(y) {
                x <<- y
        }
        get <- function() x
        set_x_inverse <- function(x_inverse) xi <<- x_inverse
        get_x_inverse <- function() xi

        list(set = set, get = get, set_x_inverse = set_x_inverse, get_x_inverse = get_x_inverse)
}


## The function cacheSolve calculates the inverse of a given matrix. Whereas the input 
## of cacheSolve is the object where makeCacheMatrix is stored. The function checks if an
## inverse matrix is already calculated. If no, it calculates the inverse matrix with the solve()
## function and sets its value in the global environment with the 'set_x_inverse' method. 
## If the inverse of a given matrix has already been calculated and is stored within the cache,
## the method 'get_x_inverse' returns its value nd assign it to variable 'xi'.

cacheSolve <- function(x, ...) {
        ## Get the inverse matrix returned by makeCacheMatrix if there is one
        xi <- x$get_x_inverse()

        if(!is.null(xi)) {
                message("getting cached data")
                return(xi)
        }

        ## Get the matrix returned by makeCacheMatrix
        data <- x$get()
        ## Return a matrix that is the inverse of 'x'
        x_inverse <- solve(data)
        ## Store the inverse matric in the global environment
        x$set_x_inverse(x_inverse)
        ## Just to indicate that it is a new calculation!
        message("calculate new inverse matrix")
        ## ...and return it!
        x_inverse
}
