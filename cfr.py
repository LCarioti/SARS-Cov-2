
import os
import pandas as pd
import numpy as np
import datetime

pd.set_option('display.max_columns', None)

ecdc = pd.read_csv('Ecdc.csv')

ecdc.columns = ['Places reporting cases','Cases','Deaths','Confirmed cases in the last 14 days']

EcdcS = ecdc.set_index(['Places reporting cases']).sort_values(['Cases'],ascending=False)

perc = EcdcS['Confirmed cases in the last 14 days'] * 100 / EcdcS['Cases']

cfr = EcdcS['Deaths'] * 100 / EcdcS['Cases']

EcdcCon = pd.concat([EcdcS,perc,cfr],axis=1).rename(columns={0:'Conf last 14 %',1:'CFR'})

EcdcCon.reset_index().to_csv('CFR.csv',index=False)

EcdcCon.reset_index().head(n=21).to_csv('CFR-Top20.csv',index=False)


EcdcCon.drop(['Cases','Deaths','Confirmed cases in the last 14 days','CFR'],axis=1)  

EcdcM = ecdc.set_index(['Places reporting cases']).sort_values(['Cases'],ascending=False)

Perc15 = EcdcM['Confirmed cases in the last 14 days'] * 100 / EcdcM['Cases']

PerConc = pd.concat([EcdcM,Perc15],axis=1).drop(['Cases','Deaths','Confirmed cases in the last 14 days'],axis=1)

Perc15 = PerConc.reset_index()

Perc15['Places reporting cases'] = Perc15['Places reporting cases'].str.replace('_', ' ')

Perc15.columns = ['Places','ConfLast15']

Perc15.to_csv('EcdcPct15.csv',index=False)
