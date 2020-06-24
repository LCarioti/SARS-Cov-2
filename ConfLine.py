
import os
import pandas as pd
import numpy as np
import datetime

pd.set_option('display.max_columns', None)

conf = pd.read_csv('Ecdc-TimeSeries_confirmed.csv')

ConfI = conf.set_index(['index'])

ConfI.columns = pd.to_datetime(ConfI.columns)


ConfIS =  ConfI.sort_values(ConfI.columns[-1],ascending=False).head(n=20)

Countries = ConfIS.index

df = pd.DataFrame()

for country in Countries:
        a = ConfIS.loc[country]
        df = pd.concat([df,a],axis=1,sort=True)

dfI = df.reset_index()

dfI['index'] = pd.to_datetime(dfI['index'])
dfIS = dfI.sort_values(['index'])

dfIS.to_csv('Top20.csv',index=False)

dfISI = dfIS.set_index(['index'])


dfPCT = dfISI.pct_change().fillna(0).replace(np.inf,0).multiply(100)
dfPCT[ dfPCT <0 ] = 0

dfPCT.reset_index().to_csv('Top20DayPerc.csv',index=False)

dfDIFF = dfISI.diff().fillna(0)
dfDIFF[ dfDIFF < 0] = 0

dfDIFF.reset_index().to_csv('Top20Daily.csv',index=False)

