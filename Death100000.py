
import os
import pandas as pd
import numpy as np
import datetime

pd.set_option('display.max_columns', None)
death = pd.read_csv('Ecdc-TimeSeries_death.csv')
DeathLast = death.iloc[:,[0,-1]]
ecdcTime = pd.read_csv('ecdcTimeseries.csv')
ecdcT = ecdcTime[ecdcTime['popData2019'].notna()]
milions =  ecdcT.loc[:,['countriesAndTerritories','popData2019']].drop_duplicates()
deathMilions = DeathLast.merge(milions, how='left', left_on='index', right_on='countriesAndTerritories')
deathMilions = deathMilions[deathMilions['popData2019'].notna()].reset_index()
deathMilions.drop(['level_0'],axis=1,inplace=True)
Dyd = deathMilions.iloc[:,[1]] * 100000
pop = deathMilions['popData2019']
perc = Dyd.div(pop, axis=0) 
dataset = pd.concat([deathMilions,perc],axis=1).iloc[:,[0,1,3,4]].dropna(axis=0).rename(columns={0:'Death / 100000'})
dataset.columns = ['Country','Death','Population', 'Death / 100000']
dataset['Country'] = dataset['Country'].str.replace('_', ' ')
dataset.to_csv('Death100000.csv',index=False)

deatM = pd.read_csv('Death100000.csv')
deatM.loc[ lambda df : df['Population'] > 1000000].sort_values(['Death / 100000'],ascending=False).head(n=20).to_csv('Death100000-TOP20.csv',index=False)

