# Data Science Specialization - Johns Hopkins University - Coursera
# Exploratory Data Analysis - Peer-graded Assignment: Course Project 1
# Name: Isaac G Veras
# Date: 05 de outubro de 2023

#======================================== PLOT4 ==============================================

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

	# Plot 4 ------------------------------------------
	png('Plot4.png',
						width  = 480,
						height = 480
				)

	par(mfrow = c(2, 2)) # Set or Query Graphical Parameter
	plot(uciTime, uci_sub$Global_active_power,
			 xlab = "",
			 ylab = "Global Active Power",
			 type = "l"
	)
	plot(uciTime, uci_sub$Voltage,
			 xlab = "datetime",
			 ylab = "Voltage",
			 type = "l"
	)
	plot(uciTime, uci_sub$Sub_metering_1,
			 type = "l",
			 xlab = "",
			 ylab = "Energy sub metering"
	)
	lines(uciTime, uci_sub$Sub_metering_2, col = "red")
	lines(uciTime, uci_sub$Sub_metering_3, col = "blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
				 col = c("black", "red", "blue"),
				 cex = 0.5,
				 lty = 1,
				 bty = "n"
	)
	
	plot(uciTime, uci_sub$Global_reactive_power,
			 xlab = "datetime",
			 ylab = "Global_reactive_power",
			 type = "l"
	)

	dev.off() # Close device