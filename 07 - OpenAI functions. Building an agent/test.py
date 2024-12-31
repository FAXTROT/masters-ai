import pandas as pd
import sqlite3

con = sqlite3.connect("source.db")

df = pd.read_csv('world_pop_mig_186_countries.csv')
df.rename(columns={df.columns[0]: 'Country'}, inplace=True)
#print(df)
df.to_sql('Migration', con=con)
con.close()
