#################
# clean_data.py #
#################

import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
DATA_DIR = BASE_DIR / "data"
RAW_DATASET = DATA_DIR / "US_Accidents_March23.csv"
OUTPUT_DATASET = DATA_DIR / "accidents_2022_clean.csv"

# using pyarrow to load fast milions of rows 
df = pd.read_csv(RAW_DATASET, engine='pyarrow')

# Converting the principal temporal line 
df['Start_Time'] = pd.to_datetime(df['Start_Time'], errors='coerce') # Forces error to NaT (can be filtered)
df_2022 = df[df['Start_Time'].dt.year == 2022]

# saving, ready for cloud!
df_2022.to_csv(OUTPUT_DATASET, index=False)
