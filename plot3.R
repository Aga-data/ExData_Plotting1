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
png("plot3.png",
    width = 480,
    height = 480)

plot(
  data$DateTime,
  data$Sub_metering_1,
  type="l",
  ylab="Energy sub metering",
  xlab=""
)

lines(
  data$DateTime,
  data$Sub_metering_2,
  col="red"
)

lines(
  data$DateTime,
  data$Sub_metering_3,
  col="blue"
)

legend(
  "topright",
  c(
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  ),
  col=c("black","red","blue"),
  lty=1
)

dev.off()