## Put comments here that give an overall description of what your
## functions do
#makeCacheMatrix extends matrix objects by allowing the caching of a matrice's inverse.

## Write a short comment describing this function
# Convert matrix into matrix-like object with inverse caching.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  
  get <- function(){
    x
  }
  
  getinverse <- function(){
    i
  }
  
  setinverse <- function(inverse){
    i <<- inverse
  }
  
  matrix(set = set, get = get,
         getinverse = getinverse,
         setinverse = setinverse)
}


## Write a short comment describing this function
# Determines the inverse of a matrix, using the cached value if available.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)){
    return(i)
  }
  
  data <- x$get()
  i <- solve(x)
  x$setinverse(i)
  i
}
