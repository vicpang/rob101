#


## data representation
    1. probability or log odds may be a matrix with each entry the probability for a cell. there are two helper functions for their conversion
    2. world coordinates and grid map 
        - point in world: 2xN matrix, each column is a point
        - gridsize: size of each grid in meters
        - offset: each point in the world need to subtract an offset 
        - points in grid map: 2xN matrix, entries are coordinates of grid map 
    in the visualizaion folder, we have a visualization for the maps