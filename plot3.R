
data = read.table("power.txt",header=TRUE, sep=";",nrows=-1)

dataFeb2 = subset(data, Date=="2/2/2007")
dataFeb1 = subset(data, Date=="1/2/2007")
dataFeb=rbind(dataFeb1,dataFeb2)
dataFeb$Date<-(as.Date(dataFeb$Date,format("%d/%m/%Y")))

dt=strptime(paste(dataFeb$Date,dataFeb$Time), "%Y-%m-%d %H:%M:%S")
plot(dt,y=dataFeb$Sub_metering_1,col=c("violet"),type="l",ylab="Energy Sub Metring")

lines(dt,y=dataFeb$Sub_metering_2,col=c("red"),type="l")

lines(dt,y=dataFeb$Sub_metering_3,col=c("blue"),type="l")

legend(cex=0.8,x="topright", inset=0.005, # places a legend at the appropriate place c("Health","Defense"), # puts text in the legend 
       
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       
       lwd=c(1,1),col=c("violet","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,"plot3.png")
dev.off()