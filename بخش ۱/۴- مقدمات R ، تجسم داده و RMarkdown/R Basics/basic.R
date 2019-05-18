### MAIN COURSE #####



## creating an object 
## <- -> both ways, as well as =. best not to use =, for reasons we shall discuss later.
x <- "hello world!"
num <- 54
state <- FALSE

## to print the value of a variable, simply type that variable
n <- 10
n


# if you want to print the value inside a function or a loop you must use the print command

## you can simply type an expression without saving it to a variable, and the result 
# will be displayed on the screen without saving it to memory 
r <- 4.5
r ** 2 * pi


# multiple commands in one line should be separated with; 
r1 <- 10 r2 <- 20 ## error
r1 <- 10; r2 <- 20


## display objects in memory:
ls()

## display objects with patters:
ls(pattern = "r")

## display objects as well as basic info:
ls.str()

## display objects with less info (when we're displaying matrices and dataframes)
print(ls.str(), max.level = 0)

## delete objects 
rm(x)

## delete objects with list
rm(list = ls(pat = "r"))

## help 
## The Description shows its use
# The usage shows the syntax
# The Arguments shows what each of the arguments mean
# The Value (if available) shows what the return value is 
?rm
help(rm)
help("rm")

## help with unconventional commands
help("%%")



## creating an object in R
# mode: basic type of elements in the object 
# 4 modes: numeric, character, complex, logical
## other modes exist but they do NOT represent data 
# such as function and list and expression. 
x <- "hello world"
mode(x)

## generating data


## vectors in R 
# making a vector
x.int <- c(2, 5, 7)
x.int
x.char <- c("hello", "how", "are", "you")
x.char
x.logical <- c(TRUE, TRUE, FALSE)
x.logical
# vectors of specific type
logical(20)
character(20)
numeric(20)
complex(20)
# but you can also just use c()

# combining vectors
x <- c(1, 2, 3)
y <- c(5, 2, 6)
c(x, y)

# arithmetics
## they are performed member by member 
x * y 
x - y 
x + y 
x %% y
x > y

## recycling rule 
z <- c(4, 2, 6, 7, -1, 3)
x + z

# special vectors
x <- 1:100
# using seq

## specifying the step
seq(from = 1, to = 100, by = 5) 
seq(from = 0, to = 1, by = 0.2)

## specifying the number of numbers :))
seq(from = 1, to = 100, length.out = 10)

# create identical data
## very basic form 
rep(1, 10)
## for other forms view ?rep

# sequence
sequence(c(2, 3))
sequence(3:6)

# sample
sample(10)

# vector indexes
x <- c(4, 2, 6, 1, 5, 3)

# one index
x[1]
# neg index
x[-1]
# out of range index
x[10]
# vector of indexes
x[c(1, 2, 3)]
# logical indexes
x[c(TRUE, TRUE, FALSE)]
## WHICHHHHH

x[x %% 2 == 0]
x[x > 3]

names(x) <- paste("mine", 1:6)


# LIST
# vectors only have one data type in them. 
# to have more than one data type in one place you can use lists
## how to make lists
c(c(1, 2, 3), "hello", 1 + 3i, FALSE) -> c
list(c(1, 2, 3), "hello", 1 + 3i, FALSE) -> l
## accessing indexes of a list 
l[1]
class(l[1])
class(l)
class(l[[1]])
l[[1]]
l[[2]]

names(l) <- paste("s", 1:length(l))
unlist(l)
# matrix 
?matrix
## arg1: elements, arg2: row number, arg3: column number, arg4: how to arrange the elements
A <- matrix(1:30, nrow = 5, ncol = 6, byrow = T)
A
dim(A)
## accessing (indexing) elements
A[5, 6]
A[c(4, 5), c(2, 3)]
## accessing an entire row 
A[5, ]
## accessing an entire column 
A[, 6]
## more than one row 
A[c(1, 2), ]


# statistical stuff

x <- runif(n = 10, min = 0, max = 1)
x

length(x)

min(x)
max(x)
range(x)

sum(x)
prod(x)

mean(x)
median(x)
sd(x)
var(x)

# dataframes 

## buildling a dataframe


olympics <- read.csv("olympic.csv")

# View the dataset 
View(olympics)

## accessing dataframe
olympics[2, 4]
## accessing a column
olympics[, "Age"] 
olympics["Age"]
class(olympics[, "Age"]) ## as a dataframe
identical(olympics[, "Age"], olympics["Age"])

olympics[["Age"]]  
olympics$Age
class(olympics[["Age"]]) ## as a vector
identical(olympics[["Age"]], olympics$Age)

identical(olympics[["Age"]], olympics["Age"])


#logical indexing
## exp
c(1, 2, 3, 4) %% 2 == 0
## for dataframe
olympics2000 <- olympics[olympics$Year == 2000, ]

## find number of male participants
nrow(olympics2000[olympics2000$Sex == 'M', ])

# find average age
mean(olympics2000$Age)

# assign a new column for score, Gold: 3, Silver: 2, Bronze: 1
## First method
olympics2000$score[olympics2000$Medal == "Gold"] <- 3
olympics2000$score[olympics2000$Medal == "Silver"] <- 2
olympics2000$score[olympics2000$Medal == "Bronze"] <- 1

## Second method: practice
olympics2000$score <- ifelse(olympics2000$Medal == "Gold", 3, 
                             ifelse(olympics2000$Medal == "Silver", 2, 1))



## using 'which' command
# for finding indexes
x <- sample(10) ## creates a random sample from 1 to 10 
which(x > 7) ## returns the indexes for which the output of the expression is true.

# SORT DATA FRAME BASED ON A COLUMN 
## using the sort and order commands 
ord <- order(olympics$Year)
View(olympics[ord, ])
# reverse the above 
## method 1 
ord <- order(-olympics$Year)
View(olympics[ord, ])
## method 2
ord <- order(olympics$Year)
View(olympics[rev(ord), ])

## LOOP

v <- c(4, 3, 2, 6, 7, 8, 4, 1, -3)
n <- length(v)
i <- 1

#while
while(i < n){
  cat(v[i], v[i] ** 2, v[i] ** 3, "\n") 
  i = i + 1
}

#for
for(i in 1:n){
  cat(v[i], v[i] ** 2, v[i] ** 3, "\n") 
}
for(vi in v){
  cat(vi, vi ** 2, vi ** 3, "\n") 
}

# we want to print all of these in one line without a for loop
## introducing: paste function
paste(1, 2, 3, "M", F)
paste0(1, 2, 3)
paste(1, 2, 3, sep = ", ")
paste("s", 1:5, sep = "0")

# return back to the other problem
cat(paste(v, v ** 2, v ** 3, "\n"))


