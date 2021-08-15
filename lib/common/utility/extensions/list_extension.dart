import 'package:collection/collection.dart' as collection;

extension ListExtension<T> on Iterable<T> {
  List<T> distinct() {
    return toSet().toList();
  }

  /// Return `null` if not found
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final T element in this) {
      if (test(element)) {
        return element;
      }
    }

    return null;
  }

  Map<S, List<T>> groupBy<S>(S Function(T element) key) {
    return collection
        .groupBy(this, key)
        .map((key, value) => MapEntry(key, value.toList()));
  }

  Iterable<T> except(Iterable<T> elements) {
    final result = List<T>.from(this);
    if (elements.isEmpty) return result;

    for (final element in elements) {
      while (result.contains(element)) {
        result.remove(element);
      }

      if (result.isEmpty) {
        break;
      }
    }
    return result;
  }

  /// check whether `elements` are the same as current list or not, that means every element of A appears in B
  /// and every element of B appears in A
  bool isEqual(Iterable<T> elements) {
    return every((x) => elements.contains(x)) &&
        elements.every((x) => contains(x));
  }
}
