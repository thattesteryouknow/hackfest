import geopandas as gpd
import matplotlib.pyplot as plt

def plot_map(gdf, column=None, cmap='viridis', title='Map'):
    fig, ax = plt.subplots(1, 1, figsize=(10, 10))
    gdf.plot(column=column, cmap=cmap, legend=True, ax=ax)
    plt.title(title)
    plt.show()

def spatial_join(stubble_gdf, admin_gdf):
    joined_gdf = gpd.sjoin(stubble_gdf, admin_gdf, how='inner', op='intersects')
    return joined_gdf

def aggregate_incidents_by_area(joined_gdf):
    aggregated_gdf = joined_gdf.groupby('admin_area').size().reset_index(name='incident_count')
    return aggregated_gdf

if __name__ == "__main__":
    clean_stubble_data = gpd.read_file('clean_stubble_burning.shp')
    clean_admin_boundaries_data = gpd.read_file('clean_admin_boundaries.shp')
    joined_data = spatial_join(clean_stubble_data, clean_admin_boundaries_data)
    aggregated_data = aggregate_incidents_by_area(joined_data)
    plot_map(clean_admin_boundaries_data, title='Administrative Boundaries')
    plot_map(clean_stubble_data, title='Stubble Burning Incidents')
    plot_map(aggregated_data, column='incident_count', title='Stubble Burning Incidents by Area')
