library("markovchain")

rows = 6

stateNames <- c("OCO","OFO","OOO", "OOV", "VO", "VV")
P <- matrix(c(1/2,   0,  0,  0,   0, 1/2,
                0, 1/2,  0,  0, 1/4, 1/4,
              0,   0, 1/2, 0, 1/2,   0,
              0,   0, 0,   1/2, 1/2, 0,
              1/6, 1/6, 1/6, 0, 1/2, 0,
              1/6, 1/6,  0, 1/6, 0, 1/2), 
             nrow=rows, byrow=TRUE)
rownames(P) <- stateNames
colnames(P) <- stateNames

startState  <- "VV"

bathroom  <- new("markovchain", transitionMatrix=P,
                 states=stateNames, name="Bathroom_Occupancy")
print( summary(bathroom) )

pathLength  <- 20
bathroomHistory  <- rmarkovchain(n=pathLength, object=bathroom,
                                 t0=startState)
cat("A sample history, starting from VV: ", bathroomHistory, "\n")

largeN  <- 4000
startStable <- 2000
history  <- rmarkovchain(n=largeN, object=bathroom, t0=startState)
stablePattern  <- history[startStable:largeN]
empiricalStable <- c(mean( stablePattern == "OCO" ),
                     mean( stablePattern == "OFO" ),
                     mean( stablePattern == "OOO" ),
                     mean( stablePattern == "OOV" ),
                     mean( stablePattern == "VO"  ),
                     mean( stablePattern == "VV"  )
                    )
theorStable <- steadyStates(bathroom)
cat("Empirical stable distribution: ",  empiricalStable, "\n")
cat("Theoretical stable distribution: ", theorStable, "\n")
