library(tidyverse) #Loading the dplyr package

# Deliverable 1
MechaCar_mpg_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) #Importing MechaCar_mpg.csv file as data frame

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg_table) #Creating multiple linear models

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg_table))#Generating summary statistics

# Deliverable 2
Suspension_Coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) #Importing Suspension_Coil.csv file as data frame

total_summary <- Suspension_Coil_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep') #Creating a total_summary data frame

lot_summary <- Suspension_Coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep') #Creating a lot_summary data frame

# Deliverable 3
PSI_Suspension_Coil_table <- Suspension_Coil_table %>% filter (PSI==1500) # Creating 1500 PSI sample table

t.test(Suspension_Coil_table$PSI,mu=mean(PSI_Suspension_Coil_table$PSI)) #Comparing all cars versus 1500 PSI means

Lot1_Suspension_Coil_table <- subset(Suspension_Coil_table, Manufacturing_Lot == "Lot1")  #Creating Lot 1 subset

t.test(Lot1_Suspension_Coil_table$PSI,mu=mean(PSI_Suspension_Coil_table$PSI)) #Comparing Lot 1 cars versus 1500 PSI means

Lot2_Suspension_Coil_table <- subset(Suspension_Coil_table, Manufacturing_Lot == "Lot2")  #Creating Lot 2 subset

t.test(Lot2_Suspension_Coil_table$PSI,mu=mean(PSI_Suspension_Coil_table$PSI)) #Comparing Lot 2 cars versus 1500 PSI means

Lot3_Suspension_Coil_table <- subset(Suspension_Coil_table, Manufacturing_Lot == "Lot3")  #Creating Lot 3 subset

t.test(Lot3_Suspension_Coil_table$PSI,mu=mean(PSI_Suspension_Coil_table$PSI)) #Comparing Lot 3 cars versus 1500 PSI means
