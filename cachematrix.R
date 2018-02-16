## Basically, this makes the cache matrix that can cache the inverse and then the cache solve that
## computes the inverse

##Computes the special matrix that can cache the inverse

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <-function(matrix) {
x <<- matrix
m <<- NULL

}
get <- function() {
x
}
setInverse <- function(inverse) {
m <<- inverse
}
getInverse <- function() {
m
}
list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}
## Computes the inverse of the special matrix

cacheSolve <- function(x, ...) {
m <- x$getInverse()
if(!is.null(m)) {
            message("getting cached data")
            return (m)
}
data <- x$get()
m <- solve(data)
x$setInverse(m)
m
}
