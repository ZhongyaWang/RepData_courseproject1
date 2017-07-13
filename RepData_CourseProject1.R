# R Reproducible Research
## Course Project 1

# reading in the dataset
activity<-read.csv("~/Downloads/activity.csv",header=TRUE)
# delete the NA in the dataset
data<-na.omit(activity)
# transfrom the dataset
date<-unique(data$date)
newdata<-data.frame(steps=numeric(0),d=numeric(0))
  for (d in date){
    data0<-data[data$date==d,]
    steps<-sum(data0$steps)
    newdata<-rbind(newdata,cbind(steps,d))
  }

# transform the dataset
newdata$steps<-as.numeric(as.character(newdata$steps))

# Histogram of the total number of steps taken each day
hist(newdata$steps,breaks=53,xlab = "number of steps",main="total number of steps taken each day")

# Mean and Median number of steps taken each day
mean<-mean(newdata$steps)
#10766.19
med<-median(newdata$steps)
#10765

#Data 2 interval as a factor
interval<-unique(activity$interval)
newdata2<-data.frame(steps=numeric(0),i=numeric(0))
for (i in interval){
   data0<-data[data$interval==i,]
   steps<-sum(data0$steps)/53
  newdata2<-rbind(newdata2,cbind(steps,i))
}

# time series plot of the average number steps taken
plot(newdata2$i,newdata2$steps,type="l")
# interval contains the maximum number of steps
max<-which.max(newdata2$steps)
#No.104
i.max<-newdata2[max,]$i
#835

# Strategy for imputing missing data
# the number of NAs
sum(is.na(activity$steps))
#
2304
# create a new newdata
activity[is.na(activity$steps),]$steps<-mean/288


# histogram
new<-data.frame(steps=numeric(0),d=numeric(0))
date1<-unique(activity$date)
for (d in date1){
  data0<-activity[activity$date==d,]
  steps<-sum(data0$steps)
 new<-rbind(new,cbind(steps,d))
}
new$steps=as.numeric(as.character(new$steps))
hist(new$steps,breaks=61,xlab = "number of steps",main="total number of steps taken each day")
abline(v=c(mean1,median1),col="red")

mean1<-mean(new$steps)
#[1] 10766.19
median1<-median(new$steps)
#10766.19

## create a new factor variable 
#  weekdays 1 and weekend 0
activity$week<-weekdays(as.Date(activity$d))
activity$weekin=NULL
for (i in 1:length(activity$week)){
if(activity$week[i]=="Saturday"){
  activity$weekin[i]<-0
}else if(activity$week[i]=="Sunday"){
  activity$weekin[i]<-0
}else activity$weekin[i]<-1
}

# panel plot
# seperate data in to two groups
weekdays<-activity[activity$weekin==1,]
weekends<-activity[activity$weekin==0,]
# interval as a factor to make a plot 
#for weekdays

weekdays2<-data.frame(steps=numeric(0),i=numeric(0))
for (i in interval){
  data0<-weekdays[weekdays$interval==i,]
  steps<-sum(data0$steps)/61
  weekdays2<-rbind(weekdays2,cbind(steps,i))
}

#for weekends
weekends2<-data.frame(steps=numeric(0),i=numeric(0))
for (i in interval){
  data0<-weekends[weekends$interval==i,]
  steps<-sum(data0$steps)/61
  weekends2<-rbind(weekends2,cbind(steps,i))
}

# plot the two panel plots
par(mfrow=c(2,1),mar=c(4,4,1,1))
plot(weekdays2$i,weekdays2$steps,type="l",xlab ="interval(weekdays)",ylab="steps")
plot(weekends2$i,weekends2$steps,type="l",xlab ="interval(weekends)",ylab="steps")




