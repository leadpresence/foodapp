class CategoryData {
  /// Gives a flag for a food category given a [name]
  static imageOf(String name) {
    return data[name]['imgurl'] ?? '?';
  }

 

  static final Map<String, Map<String, String>> data = {
    'vegetables': {'name': 'vegetables', 'imgurl': 'https://image.freepik.com/free-psd/top-view-delicious-veggies-paper-bag_23-2148322494.jpg'},
    'protein': {'name': 'protein', 'imgurl': 'https://image.freepik.com/free-photo/legumes-broccoli-fruit-salmon-placed-black-cement-floor_1150-19927.jpg'},
    'dairy': {'name': 'dairy', 'imgurl': 'https://image.freepik.com/free-photo/milk-products-wooden-table_144627-42470.jpg'},
    
  };
}
