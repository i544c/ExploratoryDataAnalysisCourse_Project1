# Data Science Specialization - Johns Hopkins University - Coursera
# Exploratory Data Analysis - Peer-graded Assignment: Course Project 1
# Name: Isaac G Veras
# Date: 05 de outubro de 2023

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
  # Plot 1 ----------------------------------------
	par(las = 1)
	png('Plot1.png',
			width  = 480,
			height = 480
	)

	hist(uci_sub$Global_active_power,
			 col  = "red",
			 xlab = "Global Active Power (kilowatts)",
			 main = "Global Active Power"
	)

	dev.off() # Close device
