import 'package:collection/collection.dart';
import 'package:recase/recase.dart';

import 'character.dart';
import 'episode.dart';
import 'link_name.dart';
import 'location.dart';
import 'pagination.dart';

class Parser {
  const Parser();

  Iterable<T> parseIterable<T>(dynamic value) {
    return value is Iterable ? value.cast<T>() : <T>[];
  }

  String enumToString<TEnum>(TEnum enumValue) {
    if (enumValue == null) return '';
    final String description = enumValue.toString();
    final int indexOfDot = description.indexOf('.');
    assert(
      indexOfDot != -1 && indexOfDot < description.length - 1,
      'The provided object "$enumValue" is not an enum.',
    );
    return description.substring(indexOfDot + 1);
  }

  /// Convert string to enum value
  TEnum enumFromString<TEnum>(
    String? key,
    List<TEnum> enumValues,
    TEnum defaultValue,
  ) {
    return enumFromStringOrNull(key, enumValues) ?? defaultValue;
  }

  /// Convert string to enum value
  TEnum? enumFromStringOrNull<TEnum>(
    String? key,
    List<TEnum> enumValues,
  ) {
    return enumValues.firstWhereOrNull((value) {
      final possibleCases = [
        enumToString(value).camelCase,
        enumToString(value).snakeCase,
      ];
      return possibleCases.contains(key);
    });
  }

  PaginatedResponse<T> parserPaginatedResponse<T>(Map<String, dynamic> json) {
    return PaginatedResponse<T>(
      info: parserPaginatedInfo(json['info']),
      results: parseIterable<T>(json['results']),
    );
  }

  PaginatedInfo parserPaginatedInfo(Map<String, dynamic> json) {
    return PaginatedInfo(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }

  LinkName parseLinkName(Map<String, dynamic> json) {
    return LinkName(
      name: json['name'],
      url: json['url'],
    );
  }

  Character parseCharacter(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: enumFromString(
        json['status'],
        CharacterStatus.values,
        CharacterStatus.unknown,
      ),
      species: json['species'],
      type: json['type'],
      gender: enumFromString(
        json['gender'],
        CharacterGender.values,
        CharacterGender.unknown,
      ),
      origin: parseLinkName(json['origin']),
      location: parseLinkName(json['location']),
      image: json['image'],
      episode: parseIterable<String>(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }

  Location parseLocation(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: parseIterable<String>(json['residents']),
      url: json['url'],
      created: json['created'],
    );
  }

  Episode parseEpisode(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
      characters: parseIterable<String>(json['characters']),
      url: json['url'],
      created: json['created'],
    );
  }
}
