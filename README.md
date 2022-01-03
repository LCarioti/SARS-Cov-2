# SARS-Cov-2


These are simple scripts to analyze ecdc's SARS-Cov-2 data (https://www.ecdc.europa.eu/en)

# Installation

These scripts depend on the following Python (3.8.5) packages: Pandas(1.2.3), numpy(1.20.1) and R (4.1.2) packages: plyr(1.8.6), viridis(0.6.1), viridisLite(0.4.0), maps(3.4.0), dplyr(1.0.6), scales(1.1.1), reshape2(1.4.4), ggplot2(3.3.3),  and run under Linux(Ubuntu 20.04.3 LTS)

# Usage example

./ScriptOne.exe

# Output
CSV files

* EuNumbers.csv: EU population, Total Infections, Total Deaaths, Infection / 1000000 , Deaths /1000000 and CFR
* cumSumC.csv: total infections top in EU countries
* dailyC.csv: daily infections in EU countries
* PctC.csv: 14 days percentage infections increase in EU countries
* cumSumD.csv: total deaths in EU countries
* dailyD.csv: daily deaths in EU countries
* PctC.csv: 14 days percentage deaths increase in EU countries


PNG files
* TotalInfectionEU.png
* DailyInfectionEU.png
* DailyInfectionsBarEu.png
* 14DayInfectionPercentageEU.png
* TotalDeathEU.png
* DailyDeathEU.png
* DailyDeathBarEu.png
* 14DaysDeathPercentageEU.png
* EuInfection.png
* EuDeaths.png
* EuCFR.png

EU CFR Map

![EuCFR](https://user-images.githubusercontent.com/34098826/147948276-2bb3cffe-eea0-48da-96d9-4329a470a2ae.png)

