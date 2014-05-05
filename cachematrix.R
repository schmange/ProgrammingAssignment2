## These two functions will create a cached matrix, then set and get its mean

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
  setmean <- function(solve) s <<- solve
  getmean <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function will calculate the mean for the cached matrix

cacheSolve <- function(x, ...)
  {
  s <- x$getmean()
  if(!is.null(s))
    {
    message("getting cached data")
    return(s)
    }
  data <- x$get()
  s <- mean(data, ...)
  x$setmean(s)
  s
}
