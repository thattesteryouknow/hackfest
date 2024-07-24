import geopandas as gpd

def load_shapefile(file_path):
    data = gpd.read_file(file_path)
    return data

def clean_geospatial_data(gdf):
    gdf = gdf[gdf.is_valid]
    gdf = gdf.dropna(subset=['geometry'])
    return gdf

if __name__ == "__main__":
    stubble_file_path = 'stubble_burning.shp'
    admin_boundaries_file_path = 'admin_boundaries.shp'
    stubble_data = load_shapefile(stubble_file_path)
    admin_boundaries_data = load_shapefile(admin_boundaries_file_path)
    clean_stubble_data = clean_geospatial_data(stubble_data)
    clean_admin_boundaries_data = clean_geospatial_data(admin_boundaries_data)
    clean_stubble_data.to_file('clean_stubble_burning.shp')
    clean_admin_boundaries_data.to_file('clean_admin_boundaries.shp')
