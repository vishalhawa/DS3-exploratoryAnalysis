

data = read.table("power.txt",header=TRUE, sep=";",nrows=-1)

dataFeb2 = subset(data, Date=="2/2/2007")
dataFeb1 = subset(data, Date=="1/2/2007")
dataFeb=rbind(dataFeb1,dataFeb2)
dataFeb$Date<-(as.Date(dataFeb$Date,format("%d/%m/%Y")))

dt=strptime(paste(dataFeb$Date,dataFeb$Time), "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2, 2))

with(dataFeb, {
  plot(dt,as.numeric(dataFeb$Global_active_power)/1000,type="l",ylab="Global Active Power (KW)")
  
  plot(dt, as.numeric(dataFeb$Voltage), type="l",ylab="Voltage")
  
  plot(dt,y=dataFeb$Sub_metering_1,col=c("violet"),type="l",ylab="Energy Sub Metring")
  
  lines(dt,y=dataFeb$Sub_metering_2,col=c("red"),type="l")
  
  lines(dt,y=dataFeb$Sub_metering_3,col=c("blue"),type="l")
  
  legend(cex=0.2,x="topright", inset=0.005, # places a legend at the appropriate place c("Health","Defense"), # puts text in the legend 
         
         lty=c(1,1), # gives the legend appropriate symbols (lines)
         
         lwd=c(1,1),col=c("violet","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(dt,y=as.numeric(dataFeb$Global_reactive_power)/1000,col=c("violet"),type="l",ylab="Global Reactive Power")
  
})

dev.copy(png,"plot4.png")
dev.off()