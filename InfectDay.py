import os
import pandas as pd
import numpy as np
import datetime



dataS = pd.read_csv('ecdcTimeseries.csv')
Cases = dataS.groupby(['dateRep'])['cases'].sum()
deaths = dataS.groupby(['dateRep'])['deaths'].sum()
Day = pd.concat([Cases,deaths],axis=1)
daily = Day.reset_index()
daily.columns = ['date','DailyInfection','DailyDeat']
daily.to_csv('Daily.csv', index=False)
InfCumSum = Day.cumsum()
cfr = InfCumSum['deaths'] * 100 / InfCumSum['cases']
Infect = pd.concat([InfCumSum,cfr],axis=1).reset_index()
Infect.columns = ['date','TotInfections','Deaths','CFR']
Infect.to_csv('Infect.csv', index=False)

