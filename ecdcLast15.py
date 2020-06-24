
import os
import pandas as pd
import numpy as np
import datetime
conf = pd.read_csv('Ecdc-TimeSeries_confirmed.csv')
coutry = regions = conf.iloc[:,[0]]
last = conf.iloc[:,[-1]]
last.columns = ['last']
fifteen  = conf.iloc[:,[-15]]
fifteen.columns = ['last15']
dateDiff = last['last'] - fifteen['last15']
dateDiff.columns = ['diff15']
death = pd.read_csv('Ecdc-TimeSeries_death.csv')
DeathLast = death.iloc[:,[-1]]
DeathLast.columns = ['Death']
TotConf = last['last'].sum()
Totdeath = DeathLast['Death'].sum()
TotDiff = dateDiff.sum()
nameW = 'World'
data = pd.concat([coutry,last,DeathLast,dateDiff],axis=1).rename(columns={0:'diff15'})
world = pd.Series([nameW,TotConf,Totdeath,TotDiff],index=['index','last','Death','diff15'])
FinalData = data.append(world,ignore_index=True)
FinalData.columns = ['Places reporting cases','Cases','Deaths','Confirmed cases in the last 14 days']
FinalData.to_csv('Ecdc.csv',index=False)
