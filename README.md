# SARS-Cov-2


These are simple scripts to analyze ecdc's SARS-Cov-2 data (https://www.ecdc.europa.eu/en)

# Installation

These scripts depends on the following Python (3.8.5) packages: Pandas(1.2.3), numpy(1.20.1) and R (4.1.2) packages: plyr(1.8.6), viridis(0.6.1), viridisLite(0.4.0), maps(3.4.0), dplyr(1.0.6), scales(1.1.1), reshape2(1.4.4), ggplot2(3.3.3),  and run under Linux(Ubuntu 20.04.3 LTS)

# Usage example

./ScriptOne.exe

# Output
CSV files

* EuRatioM.csv: Infection / 1000000 , Deaths /1000000 EU countries
* Death100000-TOP20.csv:  deaths / 100000 top 20 countries
* cumSumC.csv: total infections top EU countries
* dailyC.csv: daily infections EU countries
* PctC.csv: 14 days percentage infections increase EU countries
* cumSumD.csv: total deaths EU countries
* dailyD.csv: daily deaths EU countries
* PctC.csv: daily percentage deaths increase top 20 countries


PNG files
* TotalInfectionEU.png
* DailyInfectionEU.png
* DailyInfectionsBarEu.png
* 14DayInfectionPercentageEU.png
* TotalDeathEU.png
* DailyDeathEU.png
* DailyDeathBarEu.png
* 14DaysDeathPercentageEU.png

EU Map
https://github.com/LCarioti/SARS-Cov-2/issues/2#issue-1092186899
