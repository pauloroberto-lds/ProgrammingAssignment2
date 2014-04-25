##These function calculate the inverse of a matriz, but if it was previously
##calculated, it returns the result of the first calculation

#To execute these functions type create a matriz enviroment, for example:
m <- makeCacheMatrix(matrix(c(1, 2, 3, 4), nrow=2,ncol=2))

#Then run the functions codes below

makeCacheMatrix <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,setsolve = setsolve,getsolve = getsolve)
}

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}

#finally call the function, typing:
cacheSolve(m)

##the function will return a matrix that is the inverse of 'x'

#if you type again 
cacheSolve(m)
##the function will return the value previouly calculated.

