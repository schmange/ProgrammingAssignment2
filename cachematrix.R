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
  getmean <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function will calculate the mean for the cached matrix

cacheSolve <- function(x, ...)
  {
  m <- x$getmean()
  if(!is.null(m))
    {
    message("getting cached data")
    return(m)
    }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}
