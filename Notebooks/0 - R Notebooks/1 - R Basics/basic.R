# Datatypes ---------------------------------------------------------------
## create an object: <- -> =
### best not to use = 
x <- "hello world"
54 -> number 
state = TRUE 

## datatypes: 
### 1. numeric 
### 2. double 
### 3. character
### 4. logical
### 5. complex
typeof(x)
typeof(1 + 2i)

## print the value of an object: just type it! 
x
number * 2

## or... 
print(x)
cat(state)

## multiple commands in one line: separated with ; 
r1 <- 10 r2 <- 20 #syntax error! 
r1 <- 10; r2 <- 20

## calculate sum of numbers from 1 to 100
### using for 
sum <- 0
for(i in 1:100) { 
  sum <- sum + i
}
sum
### using while
i <- 1; sum <- 0
while(i <= 100) { 
  sum <- sum + i
  i <- i + 1
}
sum
## calculate sum of even numbers
sum <- 0
for(i in 1:100) { 
  if (i %% 2 == 0) { 
    sum <- sum + i
  }
}
sum 

## define a function
adder <- function(a, b) { return(a+b)}
adder(1, 2)

### IMP: try to print something in a function or a loop using the 3 methods!

## display defined objects: 
ls()
## delete an object 
rm(number, x)

## get help from R Documentation using ? or help()
help("rm")
?rm 
?%% #syntax error!
help("%%") # works ^_^ 

# Data Structures ---------------------------------------------------------

## 1. atomic vector or vector: made from ONE datatype 
## create using c()
x.int <- c(1, 2, 3)
x.char <- c("hello", "how", "are", "you")
x.logical <- c(T, F, TRUE)
typeof(x.logical)

## what happens if ...
c("hello", 1+2i, 4, 2.3, c(1, 2, 3), FALSE)

## operations between two vectors
x <- c(4, 2, 5, 3)
y <- c(-1, 10, 2, -5)

### combine 
c(x, y)

### arithmatic
x + y
x - y
x * y
x ** y
x %% y 

### logical 
x > y
x == y
x <= y 

### what happens if ... 
y <- c(1, 3)
x + y

## indexing: one-based! 

### using numbers
x[1] 
x[-1] # all but one 
x[10] # no out of bounds error ^_^
x[c(1, 2)] # access multiple elements
x[c(4, 2)] # in any order you want!
x[-c(1, 3)]

### using logicals
x[c(T, F, F, T)]
x[c(T, F)] # think of recycling rule!

### how to print values of x that are more than 2? 
x[x > 2]

## special functions
sequence(from = 1, to = 10, by = 1)
### or 
sequence(1, 10,1)
### or
1:10

### we use = in function arguments. so don't use it to assign variables!

sequence(from = 1, to = 10, length.out = 5)
rep(1, 100)
sample(1:10, 4)

## 2. list: made from multiple data types
list(c(1, 2, 3), "hello", 1 + 3i, FALSE) -> l
typeof(l)

## indexing: very weird :D 
l[1]
typeof(l[1])
l[1][1][1][1][1]
typeof(l[1][1][1][1])
l[2]
typeof(l[2])
typeof(l[2][1][1][1][1])
### you could conclude that 'list' is a 'vector' of lists... 

l[[1]]
typeof(l[[1]])
l[[1]][2]

## kind of ugly... named lists!
names(l) <- c("vector", "greetings", "complex", "logic")
l
l$vector
typeof(l$greetings)
l[["logic"]]

## if you want to name only ONE element... 
names(l)[2] <- "new name"

## if you don't want to type all the names... 
names(l) <- paste("elem", 1:length(l), sep = "")

## if you want to go back to normal...
unname(l) -> l

## if you don't like lists ... :(
unlist(l) -> l

## 3. matrix

## create a 5 * 6 matrix filled by row with numbers from 1 to 30
matrix(data = 1:30, nrow = 5, ncol = 6, byrow = T) -> M
typeof(M)
dim(M)

# indexing 
M[1]  # linear access
M[27] # difficult!
M[1, 3] # two-dim access
M[c(1, 2), c(5, 3)]
M[-1, ]
M[, 2]

## 4. data structues 

## read from file
mobile <- read.csv("mobile.csv")
typeof(mobile)

View(mobile)

mobile[1, 2] # difficult
mobile[1, "device"]
mobile[1, ]
mobile[, "device"]

typeof(mobile["device"])
typeof(mobile[, "device"])
typeof(mobile[["device"]])
typeof(mobile$device)

## filter 
mobile2000 <- mobile[mobile$year == 2000, ]

## create new column!
mobile$area <- mobile$dim_length * mobile$dim_breadth

## arrange 
mobile[order(mobile$year), ] -> mobile.sorted.year

## delete NAs in price
mobile[!is.na(mobile$price), ] -> mobile

## statictical functions

### earlist mobile release
min(mobile$year) # what to do about NAs? 
### sol1: filter
min(mobile[!is.na(mobile$year), ]$year)
### sol2: min arguments
min(mobile$year, na.rm = T)

### average price 
mean(mobile$price, na.rm = T)

### dim_length variance
var(mobile$dim_length, na.rm = T)

### highest and lowest camera pixel count 
range(mobile$cam_px, na.rm = T)
