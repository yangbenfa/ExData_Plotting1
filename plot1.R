

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

hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main = "Global Active Power",ylim = c(0,1200))

#保存图形文件
dev.copy(png, file = "plot1.png") 
dev.off() 


#第2个代码及图形
