enum enCategories {
  laptop(
    3,
    'Laptop',
  ),
  camera(
    4,
    'Camera',
  ),
  phones(
    8,
    'Phones',
  ),
  shoes(
    9,
    'Shoes',
  ),
  dresses(
    10,
    'Dresses',
  );

  const enCategories(
    this.id,
    this.name,
  );

  final int id;
  final String name;

  // Helper method to get enum from id
  static enCategories? fromId(int id) {
    try {
      return values.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }

  // Helper method to get enum from name
  static enCategories? fromName(String name) {
    try {
      return values.firstWhere((category) => category.name == name);
    } catch (e) {
      return null;
    }
  }
}
