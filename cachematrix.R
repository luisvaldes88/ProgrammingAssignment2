## cachematrix.R provides two functions that implements a mecanism that allows
## the user to save the state of a matrix and its calculated inverse.
## By caching the inverse of the matrix, it allows you to save computation time

## Creates an object that with three utility functions that enables
## the user to cache the inverse of a matrix 
## @get           returns the data of the matrix
## @setinverse    sets the cached inverse of the matrix
## @getinverse    returns the cached inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  get <- function() {
    x
  }
  setinverse <- function(inv) {
    inverse <<- inv
  }
  getinverse <- function() {
    inverse
  }
  list(get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


## This function receives an object 'x' of type 'makeCacheMatrix' 
## and verifies if 'x' already has a cached inverse, if it doesn't have
## it calculates its inverse and saves the new state of 'x' by 
## setting the the new calculated inverse
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinverse()
    if(is.null(inverse)) {
      message("getting cached data")
      data = x$get()
      inverse = solve(data)
      x$setinverse(inverse)
    }
    inverse
}
