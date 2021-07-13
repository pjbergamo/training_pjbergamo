#Session 10 - Writing functions and packages

## Simple examples
airtemps <- c(212, 30.3, 78, 32)
celsius1 <- (airtemps[1] - 32) * 5 / 9
celsius2 <- (airtemps[2] - 32) * 5 / 9
celsius3 <- (airtemps[3] - 32) *5 / 9

##Inset Roxygen command in Code tab to insert this structured help template for functions

#' Convert fahrenheit to celsius
#'
#' @param fahr Our fahrenheit values
#'
#' @return The converted values in celsius
#' @export
#'
#' @examples
#' fahr_to_celsius(212)

fahr_to_celsius <- function(fahr) {
  (fahr - 32) * 5 / 9
  
}

airtemps_celsius <- fahr_to_celsius(airtemps)

#Challenge - create the reverse function
celsius_to_fahr <- function(celsius) {
  fahr<-(celsius * 9/5) + 32
  fahr
}

celsius_to_fahr(airtemps_celsius)


convert_temps <- function(fahr) {
  celsius <- (fahr - 32) * 5 / 9
  kelvin <- celsius + 273.15
  
  list(fahr = fahr, celsius = celsius, kelvin = kelvin)
}

temps_df <- data.frame(convert_temps(seq(-100, 100, 10)))

##plots
library(ggplot2)

#making bits of a ggplot theme into functions
custom_theme <- function(base_size = 9) {
  ggplot2::theme(text = element_text(size = base_size))
  
}

ggplot(temps_df, aes(fahr, celsius, color = kelvin)) +
  geom_point() +
  custom_theme(20)

##the entire ggplot can be embedded in a function to gain reproducibility
#if working with multiple plots
scatterplot <- function(df, font_size=9) {
  ggplot(df, mapping=aes(x=fahr, y=celsius, color=kelvin)) +
    geom_point() +
    custom_theme(font_size)
}

