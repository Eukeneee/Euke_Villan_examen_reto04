
library(dplyr)
library(plumber)
#*@apiTitle Minutos usados
#*@apiDescription api que trabaje con los minutos
#*@param Minutes
#*@get /Minutes
function(Minutes){
  Minutes<- as.numeric(datos$Minutes)
  datos$Minutes<- log(datos$Minutes)
  return(ggplot(datos,aes(x=Minutes))+
geom_histogram())
}

