
data = read.table("power.txt",header=TRUE, sep=";",nrows=-1)

dataFeb2 = subset(data, Date=="2/2/2007")
dataFeb1 = subset(data, Date=="1/2/2007")
dataFeb=rbind(dataFeb1,dataFeb2)
dataFeb$Date<-(as.Date(dataFeb$Date,format("%d/%m/%Y")))

hist1<-(hist(as.numeric(dataFeb$Global_active_power)/1000,col="red",xlab="Global Active Power (KW)",main="Global Active Power"))

dev.copy(png,"plot1.png")
dev.off()
#----- end of Plot1 --------------------

dt=strptime(paste(dataFeb$Date,dataFeb$Time), "%Y-%m-%d %H:%M:%S")
plot(dt,as.numeric(dataFeb$Global_active_power)/1000,type="l",ylab="Global Active Power (KW)")
