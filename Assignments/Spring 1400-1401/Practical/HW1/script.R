# radius = 1, Equilateral triangle side = sqrt(3)

simulate <- function(hypotenuse_selection_method){
	number_of_trials <-10000
	trials <- 1:number_of_trials
	side_length <- sqrt(3)
	trials <- sapply(trials, function(x) hypotenuse_selection_method() >= side_length)
	return(length(trials[trials == TRUE])/length(trials))
}

method_1 <- function(){
	p1 <- runif(1, 0, 2*pi)
	p2 <- runif(1, 0, 2*pi)
	angle <- min(abs(p1-p2), 2*pi - abs(p1-p2))
	return(2 * sin(angle/2))
}

method_2 <- function(){
	return(0)
}

method_3 <- function(){
	return(0)
}

cat('probabitly calculated by simulation for method1: ', simulate(method_1))

cat('probabitly calculated by simulation for method2: ', simulate(method_2))

cat('probabitly calculated by simulation for method3: ', simulate(method_3))