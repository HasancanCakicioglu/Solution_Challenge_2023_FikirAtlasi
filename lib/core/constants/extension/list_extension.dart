
/// List extension to add all elements if not contains
extension ListExtension<T> on List<T> {
  void addAllIfNotContains(List<T> elements) {
    for (var element in elements) {
      if (!contains(element)) {
        add(element);
      }
    }
  }
}