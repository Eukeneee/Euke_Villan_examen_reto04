library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)


datos<- read.csv("C:/Users/ev269/Downloads/netflix.csv")
########## LIMPIEZA DE DATOS ###############
summary(datos)
sd_minutes<- sd(datos$Minutes,na.rm=TRUE)
sd_seasons<- sd(datos$Seasons,na.rm=TRUE)

length(unique(datos$type))
length(unique(datos$country))
length(unique(datos$director))

## NA-s variable 
miss_var_summary(datos)
# visualizar 
vis_miss(datos)

# imputar NA-s seasons y minutes
imput<-kNN (datos, k=5)
unique(imput ["Seasons"])
unique(imput ["Minutes"])
