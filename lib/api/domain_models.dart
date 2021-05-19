import 'api_models.dart';
import 'parsing_extensions.dart';

enum EntityType { character, location, episode }

class Character {
  /// The id of the character.
  final int id;

  /// The name of the character.
  final String name;

  /// The status of the character ('Alive', 'Dead' or 'unknown').
  final String status;

  /// The species of the character.
  final String species;

  /// The type or subspecies of the character.
  final String type;

  /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
  final String gender;

  /// Name and link to the character's origin location.
  final LinkName origin;

  /// Name and link to the character's last known location endpoint.
  final LinkName location;

  /// (url)	Link to the character's image. All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
  final String image;

  /// (urls)	List of episodes in which this character appeared.
  final Iterable<String> episode;

  /// (url)	Link to the character's own URL endpoint.
  final String url;

  /// Time at which the character was created in the database.
  final String created;

  Character.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        type = json['type'],
        gender = json['gender'],
        origin = LinkName.fromJson(json['origin']),
        location = LinkName.fromJson(json['location']),
        image = json['image'],
        episode = json.parseIterable<String>('episode'),
        url = json['url'],
        created = json['created'];
}

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

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        type = json['type'],
        dimension = json['dimension'],
        residents = json.parseIterable<String>('residents'),
        url = json['url'],
        created = json['created'];
}

class Episode {
  /// The id of the episode.
  final int id;

  /// The name of the episode.
  final String name;

  /// The air date of the episode.
  final String airDate;

  /// The code of the episode.
  final String episode;

  /// (urls)	List of characters who have been seen in the episode.
  final Iterable<String> characters;

  /// (url)	Link to the episode's own endpoint.
  final String url;

  /// Time at which the episode was created in the database.
  final String created;

  Episode.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        airDate = json['air_date'],
        episode = json['episode'],
        characters = json.parseIterable<String>('characters'),
        url = json['url'],
        created = json['created'];
}
