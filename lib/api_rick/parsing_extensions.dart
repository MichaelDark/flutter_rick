extension MapParsingExt on Map<String, dynamic> {
  Iterable<T> parseIterable<T>(String key) =>
      this[key] is Iterable ? (this[key] as Iterable).cast<T>() : <T>[];
}
