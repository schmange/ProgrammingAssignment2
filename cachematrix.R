## These two functions will create a cached matrix, then set and get its inverse

## This function will create a cached matrix

makeCacheMatrix <- function(x = matrix()) 
{
  s <- NULL
  set <- function(y)
    {
    x <<- y
    s <<- NULL
    }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function will calculate the inverse of the cached matrix

cacheSolve <- function(x, ...)
  {
  s <- x$getsolve()
  if(!is.null(s))
    {
    message("getting cached data")
    return(s)
    }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
