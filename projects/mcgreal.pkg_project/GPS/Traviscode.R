______________________________________________________________
CREATYING AND CLEANING DF
______________________________________________________________
TestX <- data_GPS[16:2081, 13]
TestY <- data_GPS[16:2081, 14]
TestZ <- data_GPS[16:2081, 15]
Testtime <- data_GPS[16:2081, 27]
Testlat <- data_GPS[16:2081, 25]
Testlon <- data_GPS[16:2081, 26]
TestID <- data_GPS[16:2081, 1]
test_df <- data.frame(Testtime, TestID, TestX, TestY, TestZ, Testlat, Testlon)
View(test_df)
colnames(test_df)[1] <- "Timestamp"
colnames(test_df)[2] <- "ID"
colnames(test_df)[3] <- "X"
colnames(test_df)[4] <- "Y"
colnames(test_df)[5] <- "Z"
colnames(test_df)[6] <- "Latitude"
colnames(test_df)[7] <- "Longitude"

library(lubridate)
options(digits.secs = 3)
test_df$Timestamp <- ymd_hms(test_df$Timestamp, tz = "UTC")
test_df$Timestamp <- with_tz(test_df$Timestamp, tzone = "America/Chicago")
___________________________________________________________
CALCULATING VEDBA
___________________________________________________________

VeDBA = sqrt(test_df$X^2 + test_df$Y^2 + test_df$Z^2)
test_df$VeDBA <- VeDBA

___________________________________________________________
MAPPING
___________________________________________________________
install.packages("ggmap")
library(ggmap)
library(cowplot)
register_google(key = "AIzaSyDkDm-xDPMFeWS7F7CgQhALUGRA9sbTSZM")

boundingbox <- c(left = -90.47, bottom = 30.50, right = -90.46, top = 30.52)
map <- get_map(boundingbox, zoom = 16, maptype = "terrain")
ggmap(map) + 
  geom_path(data = test_df, aes(x = Longitude, y = Latitude, color = VeDBA),
          size = 1.5, lineend = "round", alpha = 0.6) +
  theme(legend.position = "right")



