########### API #############

library(plumber)
library(ggplot2)
datos<- read.csv("C:/Users/ev269/Downloads/netflix.csv")
api_minutos<-"
library(dplyr)
library(plumber)
#*@apiTitle Minutos usados
#*@apiDescription api que trabaje con los minutos
#*@param Minutes
#*@get /Minutes
function(Minutes){
  Minutes<- as.numeric(datos$Minutes)
  datos$Minutes<- log(datos$Minutes)
  return(hist(datos$Minutes))
}
plot<- ggplot(datos,aes(x=Minutes))+
  geom_histogram()
"
writeLines(api_minutos,"API.R")

r<- plumb("API.R")
r$run(port=8000)
