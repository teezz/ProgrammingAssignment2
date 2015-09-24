# source("cachematrix.R")
# e.g. x <- matrix(c(1, -2, 1, 1), nrow = 2)

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Get the inverse matrix returned by makeCacheMatrix if there is one
        xi <- x$get_x_inverse()

        if(!is.null(xi)) {
                message("getting cached data")
                return(xi)
        }

        ## Get the matrix returned by makeCacheMatrix
        data <- x$get()

        ## Return a matrix that is the inverse of 'x' and return it
        x_inverse <- solve(data)
        x$set_x_inverse(x_inverse)
        message("calculate new inverse matrix")
        x_inverse
}
