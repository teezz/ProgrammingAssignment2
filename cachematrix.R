# source("makeCacheMatrix.R")
# e.g. x <- matrix(c(1, -2, 1, 1), nrow = 2)

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  set <- function(y) {
        x <<- y
  }

  get <- function() x

  list(set = set, get = get)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
