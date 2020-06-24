

import os
import pandas as pd
import numpy as np
import datetime

pd.set_option('display.max_columns', None)

ecdcT = pd.read_csv('ecdcTimeseries.csv')

data = pd.pivot_table(ecdcT, index=['countriesAndTerritories'], columns= ['dateRep'], values=['cases'])

data.columns = data.columns.droplevel(0)

data.columns.name = None

Countries = data.index

df = pd.DataFrame()

for country in Countries:
	a = data.loc[country]
	df = pd.concat([df,a],axis=1,sort=True)

dfI = df.reset_index()

dfI['index'] = pd.to_datetime(dfI['index'], dayfirst=True)
dfI['index'] =  pd.to_datetime(dfI['index'], dayfirst=True).dt.date

dfIS =   dfI.sort_values(['index'])
dfISZ = dfIS.fillna(0)
dfCS = dfISZ.set_index(['index']).cumsum()

del df
del dfI
del dfIS

timeDate = dfCS.index

df = pd.DataFrame()
for timeDay in timeDate:
	b = dfCS.loc[timeDay]
	df = pd.concat([df,b],axis=1,sort=True)

df.reset_index().fillna(0).to_csv('Ecdc-TimeSeries_confirmed.csv',index=False)
Conf = df.reset_index().fillna(0)

ConfI = Conf.set_index(['index'])

ConfI.columns = pd.to_datetime(ConfI.columns)


del Countries
del country
del a
del df
del data
del dfISZ
del dfCS
del timeDate
del timeDay
del b

data2 = pd.pivot_table(ecdcT, index=['countriesAndTerritories'], columns= ['dateRep'], values=['deaths'])

data2.columns = data2.columns.droplevel(0)
data2.columns.name = None

Countries = data2.index

df = pd.DataFrame()

for country in Countries:
	a = data2.loc[country]
	df = pd.concat([df,a],axis=1,sort=True)

dfI = df.reset_index()
dfI['index'] =  pd.to_datetime(dfI['index'], dayfirst=True).dt.date


dfIS =   dfI.sort_values(['index'])
dfISZ = dfIS.fillna(0)
dfCS = dfISZ.set_index(['index']).cumsum()

del df
del dfI
del dfIS

timeDate = dfCS.index

df = pd.DataFrame()
for timeDay in timeDate:
	b = dfCS.loc[timeDay]
	df = pd.concat([df,b],axis=1,sort=True)

df.reset_index().fillna(0).to_csv('Ecdc-TimeSeries_death.csv',index=False)
Death  = df.reset_index().fillna(0)

DeathI = Death.set_index(['index'])

DeathI.columns = pd.to_datetime(DeathI.columns)

