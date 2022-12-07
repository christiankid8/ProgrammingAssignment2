## these functions cache the inverse of a matrix

## the functions do this by...
## setting the value of the matrix and receiving the value of the matrix
## setting and getting the value of inverse in the matrix


makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## this function will cachSolve recieve the inverse of the matric returned above


cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
x = rbind(c(6, -8), c(-16, 4))
m = makeCacheMatrix(x)
m$get() 
##    [,1] [,2]
## [,1]  6   -8
## [2,] -16   4