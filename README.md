# BVLAD
This is a MATLAB implementation of the binary vector of locally aggregated descriptors (BVLAD) and a test of its capabilities as a computationally inexpensive image retrieval descriptor.
BVLAD was introduced in "Camera-based indoor positioning using scalable streaming of compressed binary image signatures" by D. Van Opdenbosch et al. to reduce the cost of streaming data in mobile camera-based localisation systems by using binary descriptors and a lossy compression scheme while maintaining the full retrieval performance of non-binary descriptors.

## The scripts
In order to test the image retrieval potential of the descriptor:
* Save your dataset (e.g. pictures of a room or a building) in the folder *cell_imgs* and the images to be queried in *query_imgs*.
* A dictionary must be generated from your dataset with the script *compute_dictionary.m*.
* Run *compute_cell.m* to compute the BVLAD points from the dataset.
* Run *main_cell.m* to retrieve the most similar images in *cell_imgs* for each query image in *query_imgs*
