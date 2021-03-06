
#第3个图形的绘图代码
#读取数据（2007年2月1日与2007年2月2日的数据）
data<-read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE,skip=66636,nrows=2880)

#给数据框的每一列命名
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power",
               "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#将Date和Time变量转换为R中的Date/Time类

#合并Date和Time为一个字段datetime
data$datetime<- paste(data$Date, data$Time)

#完成转换（转换为R中的Date/Time类）
data$datetime<- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
#转换数据类型
for(i in 3:9)
{
        data[,i]<-as.numeric(data[,i])
        
}

#绘图
par(cex.axis=0.7,cex.lab=0.7)
plot(x=data$datetime,y=data$Sub_metering_1,type="l",ylab="Energy sub metering",
     xlab=" ")

lines(x=data$datetime,y=data$Sub_metering_2,col="red")
lines(x=data$datetime,y=data$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       xjust=1,cex=0.8)
#保存图形文件
dev.copy(png, file = "plot3.png") 
dev.off() 

