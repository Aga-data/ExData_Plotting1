# Read data
data <- read.table(
  "household_power_consumption.txt",
  sep = ";",
  header = TRUE,
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Select dates
data <- data[
  data$Date %in% c("1/2/2007", "2/2/2007"),
]

# Create datetime
data$DateTime <- strptime(
  paste(data$Date, data$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

# Plot code
png("plot2.png",
    width = 480,
    height = 480)

plot(
  data$DateTime,
  data$Global_active_power,
  type="l",
  xlab="",
  ylab="Global Active Power (kilowatts)"
)

dev.off()