#makeCacheMatrix creates a special matrix 
#and cacheSolve checks if the inverse of the matrix was already 
#calculated and saved to the cache and orints it. 
#If not, it is calculated and printed

#This function creates a special "matrix" object 
#that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  im <- NULL
  set <- function(y) {
    x <<- y
    im <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) im <<- inverse
  getinverse <- function() im
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

#This function computes the inverse of the special "matrix" returned 
#by makeCacheMatrix above. If the inverse has already been calculated 
#(and the matrix has not changed), then the cachesolve should 
#retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  im <- x$getinverse()
  if(!is.null(im)) {
    message("getting cached data")
    return(im)
  }
  matrix <- x$get()
  im <- solve(matrix, ...)
  x$setinverse(im)
  im
}# Return a matrix that is the inverse of 'x'
}
