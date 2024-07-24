import pandas as pd
import numpy as np

def load_data(file_path):
    data = pd.read_csv(file_path)
    return data

def clean_data(df):
    df = df.dropna()
    df = df.drop_duplicates()
    df['stubble_quantity'] = pd.to_numeric(df['stubble_quantity'], errors='coerce')
    df['soil_health'] = pd.to_numeric(df['soil_health'], errors='coerce')
    df.fillna(df.mean(), inplace=True)
    return df

if __name__ == "__main__":
    file_path = 'stubble_data.csv'
    data = load_data(file_path)
    clean_data = clean_data(data)
    clean_data.to_csv('clean_stubble_data.csv', index=False)
