install.packages("swirl")
library("swirl")
install_from_swirl("Exploratory Data Analysis")
swirl()

printmessage<-function(x) {
  if(x>0)
    print("x is bigger than zero")
  else
    print("x is less than or equal to zero")
  invisible(x)
}
state="WV";outcome="pneumonia";num="worst"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = "./data/Housing.scv")
dataH<-read.table("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",header=TRUE,sep=",")

url<-"http://cran-logs.rstudio.com/"
mydf<-read.csv(url, stringsAsFactors = FALSE)
