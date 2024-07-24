import pandas as pd
def prepare_data():
    data = {
        'farmer_id': [1, 2, 3, 4, 5],
        'stubble_quantity': [100, 150, 200, 250, 300],
        'soil_health': [7.5, 6.8, 8.0, 7.2, 6.9],
        'crop_yield': [10, 12, 13, 11, 10]
    }
    df = pd.DataFrame(data)
    df.to_csv('stubble_data.csv', index=False)
if __name__ == "__main__":
    prepare_data()
