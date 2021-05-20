import 'models.dart';

Type typeOf<T>() => T;

EntityType getEntityTypeFromType<T>() {
  final type = typeOf<T>();
  final entityType = {
    Character: EntityType.character,
    Location: EntityType.location,
    Episode: EntityType.episode,
  }[type];
  if (entityType == null) throw 'Unsupported type';
  return entityType;
}

extension EntityTypeExt on EntityType {
  String get path {
    switch (this) {
      case EntityType.character:
        return 'character';
      case EntityType.location:
        return 'location';
      case EntityType.episode:
        return 'episode';
    }
  }

  T Function(Map<String, dynamic>) getConverter<T>() {
    switch (this) {
      case EntityType.character:
        return ((Map<String, dynamic> json) => Character.fromJson(json)) as T
            Function(Map<String, dynamic>);
      case EntityType.location:
        return ((Map<String, dynamic> json) => Location.fromJson(json)) as T
            Function(Map<String, dynamic>);
      case EntityType.episode:
        return ((Map<String, dynamic> json) => Episode.fromJson(json)) as T
            Function(Map<String, dynamic>);
    }
  }
}
