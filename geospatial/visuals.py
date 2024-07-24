import geopandas as gpd
import matplotlib.pyplot as plt

def plot_geospatial_data(gdf, title='Geospatial Data', column=None, cmap='viridis'):
    fig, ax = plt.subplots(1, 1, figsize=(12, 8))
    gdf.plot(column=column, cmap=cmap, legend=True, ax=ax)
    plt.title(title)
    plt.xlabel('Longitude')
    plt.ylabel('Latitude')
    plt.show()

if __name__ == "__main__":
    clean_stubble_data = gpd.read_file('clean_stubble_burning.shp')
    clean_admin_boundaries_data = gpd.read_file('clean_admin_boundaries.shp')
    plot_geospatial_data(clean_admin_boundaries_data, title='Administrative Boundaries')
    plot_geospatial_data(clean_stubble_data, title='Stubble Burning Incidents')
