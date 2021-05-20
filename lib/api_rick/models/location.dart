class Location {
  /// The id of the location.
  final int id;

  /// The name of the location.
  final String name;

  /// The type of the location.
  final String type;

  /// The dimension in which the location is located.
  final String dimension;

  /// (urls)	List of character who have been last seen in the location.
  final Iterable<String> residents;

  /// (url)	Link to the location's own endpoint.
  final String url;

  /// Time at which the location was created in the database.
  final String created;

  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
}
