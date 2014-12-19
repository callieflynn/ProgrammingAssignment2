## The following two functions cache the inverse of a matrix, saving time if
## you need to repeatedly compute matrix inversions.

## mackeCacheMatrix creates a special "matrix" object that can cache its inverse.
## It also defines functions to set and get a matrix's inverse.
makeCacheMatrix <- function(x = matrix()) {
  #placeholder for matrix inverse
  v <- NULL 
  
  set <- function (y) {
    x <<- y
    v <<-NULL
  }
  ##create functions to get and set cached inverses
  get <- function() x  
  setinverse <- function(inverse) v <<- inverse
  getinverse <- function() v
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then it returns the cached inverse.

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  
  ##check to see if already cached
  if (!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  ##otherwise, compute the inverse and cache it
  inverse <- solve(x)
  x$setinverse(inverse)
  inverse
}

