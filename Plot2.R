# Data Science Specialization - Johns Hopkins University - Coursera
# Exploratory Data Analysis - Peer-graded Assignment: Course Project 1
# Name: Isaac G Veras
# Date: 05 de outubro de 2023

#======================================== PLOT3 ==============================================

R.version.string   # R 4.3.1
getwd(); cat("\n") # Current working directory
setwd("C:/Johns Hopkins - Data Science/Exploratory Data Analysis/Peer-graded Assignment - Course Project 1")

# Package installation: ----------------------------------------------------------------------
	if (!require("pacman")) install.packages("pacman")
	pacman::p_load(pacman,     # Package Manager
		       data.table, # Manipulate, process and analyze large data sets
		       tidyverse   # organização dos dados
	)

# Dataset: Electric Power Consumption ---------------------------------------------------------
	uci <- read.delim("household_power_consumption.txt",
			  sep              = ";", # The field separator character
			  na.strings       = "?", # Missing values are encoded as "?"
			  stringsAsFactors = FALSE
		)
		
		names(uci)

	uci_sub <- uci[uci$Date %in% c("1/2/2007","2/2/2007"), ] # Sub-setting the data

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
	#conversion of date column to date class
	uciDate <- as.Date(uci_sub[, 1], format = "%d/%m/%Y")
	class(uciDate) #checking the class
	uciTime <- as.POSIXct(paste(uciDate, uci_sub[, 2])) #pasting the date and time together
	
	# Plot 2 -----------------------------------------
	png('Plot2.png',
				width  = 480,
				height = 480
		)
	
	plot(uciTime, uci_sub[, 3],
				 xlab = "",
				 ylab = "Global Active Power (kilowatts)",
				 type = "l"
		)
