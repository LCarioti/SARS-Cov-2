import os
import pandas as pd
import numpy as np
import datetime
eu = pd.read_csv('dataEU.csv', sep='\t')

#############################

data = pd.pivot_table(eu, index=['countriesAndTerritories'], columns= ['dateRep'], values=['cases'])

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
dfISZ.to_csv('dailyC.csv', index=False)
dfCS = dfISZ.set_index(['index']).cumsum()
dfCSm = dfCS.iloc[1: , :]
dfCSm.reset_index().to_csv('cumSumC.csv', index=False)
dfCSmPc = dfCSm.pct_change(periods=14).fillna(0).replace(np.inf,0).multiply(100)
dfCSmPc[ dfCSmPc <0] = 0
dfCSmPc.reset_index().to_csv('PctC.csv', index=False)

#########################################################

del data
del Countries
del country
del a
del df
del dfI
del dfIS
del dfISZ
del dfCSm
del dfCSmPc

########################################################


data2 = pd.pivot_table(eu, index=['countriesAndTerritories'], columns= ['dateRep'], values=['deaths'])

data2.columns = data2.columns.droplevel(0)
data2.columns.name = None
Countries = data2.index

df = pd.DataFrame()
for country in Countries:
    a = data2.loc[country]
    df = pd.concat([df,a],axis=1,sort=True)

dfI = df.reset_index()
dfI['index'] = pd.to_datetime(dfI['index'], dayfirst=True)
dfI['index'] =  pd.to_datetime(dfI['index'], dayfirst=True).dt.date
dfIS =   dfI.sort_values(['index'])

dfISZ = dfIS.fillna(0)
dfISZ.to_csv('dailyD.csv', index=False)
dfCS = dfISZ.set_index(['index']).cumsum()
dfCSm = dfCS.iloc[1: , :]
dfCSm.reset_index().to_csv('cumSumD.csv', index=False)
dfCSmPc = dfCSm.pct_change(periods=14).fillna(0).replace(np.inf,0).multiply(100)
dfCSmPc[ dfCSmPc <0] = 0
dfCSmPc.reset_index().to_csv('PctD.csv', index=False)

########################################################################

del dfCSmPc
del dfCSm
del dfCS
del dfISZ
del dfIS
del dfI
del df
del a 
del data2
del country
del Countries


Csum = pd.read_csv('cumSumC.csv')
CsumI=Csum.set_index(['index'])
LastC=CsumI.iloc[-1]
Dsum=pd.read_csv('cumSumD.csv')
DsumI=Dsum.set_index(['index'])
LastD=DsumI.iloc[-1]
LastCI=LastC.reset_index()
LastDI=LastD.reset_index()
pop=eu[['countriesAndTerritories','popData2020']].drop_duplicates()
PopI=pop.reset_index()
EuPop=PopI.drop('index',1)
df=pd.concat([EuPop,LastCI,LastDI],axis=1)
df.columns =['Countries','population','Count1','TotalInfrction','Count2','TotalDeath']
dfI=df.drop(['Count1','Count2'],axis=1)
InfectRatio=dfI['TotalInfrction'] / ( dfI['population']/1000000)
DeathRatio=dfI['TotalDeath'] / ( dfI['population']/1000000)
CFR = dfI['TotalDeath'] *100 / dfI['TotalInfrction']
DataF=pd.concat([dfI,InfectRatio,DeathRatio,CFR],axis=1)
DataFinal=DataF.rename(columns={0:'InfectRatio',1:'DeathRatio',2:'CFR'})
DataFinal.to_csv('EuNumbers.csv',index=False)
