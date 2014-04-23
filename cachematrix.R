## These two functions will create a cached matrix, then set and get its mean

## This function will create a cached matrix

makeCacheMatrix <- function(x = matrix()) 
{
  m <- NULL
  set <- function(y)
    {
    x <<- y
    m <<- NULL
    }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
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
