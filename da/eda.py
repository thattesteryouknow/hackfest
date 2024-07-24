import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

def plot_histogram(df, column):
    plt.figure(figsize=(10, 6))
    sns.histplot(df[column], bins=30, kde=True)
    plt.title(f'Histogram of {column}')
    plt.xlabel(column)
    plt.ylabel('Frequency')
    plt.show()

def plot_scatter(df, column1, column2):
    plt.figure(figsize=(10, 6))
    sns.scatterplot(x=column1, y=column2, data=df)
    plt.title(f'Scatter plot of {column1} vs {column2}')
    plt.xlabel(column1)
    plt.ylabel(column2)
    plt.show()

if __name__ == "__main__":
    data = pd.read_csv('clean_stubble_data.csv')
    plot_histogram(data, 'stubble_quantity')
    plot_scatter(data, 'stubble_quantity', 'soil_health')
