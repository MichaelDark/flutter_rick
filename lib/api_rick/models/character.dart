import 'link_name.dart';

enum CharacterStatus { alive, dead, unknown }

enum CharacterGender { male, female, genderless, unknown }

class Character {
  /// The id of the character.
  final int id;

  /// The name of the character.
  final String name;

  /// The status of the character ('Alive', 'Dead' or 'unknown').
  final CharacterStatus status;

  /// The species of the character.
  final String species;

  /// The type or subspecies of the character.
  final String type;

  /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
  final CharacterGender gender;

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

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
}
