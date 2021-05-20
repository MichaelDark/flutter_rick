import 'character.dart';
import 'episode.dart';
import 'location.dart';
import 'parser.dart';

enum EntityType {
  character,
  location,
  episode,
}

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
  String get path => Parser().enumToString(this);

  T Function(Map<String, dynamic>) getParser<T>() {
    final parser = Parser();
    switch (this) {
      case EntityType.character:
        return parser.parseCharacter as T Function(Map<String, dynamic>);
      case EntityType.location:
        return parser.parseLocation as T Function(Map<String, dynamic>);
      case EntityType.episode:
        return parser.parseEpisode as T Function(Map<String, dynamic>);
    }
  }
}
