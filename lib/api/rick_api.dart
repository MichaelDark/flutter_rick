import 'dart:convert';

import 'package:http/http.dart' as http;

class RickApi {
  static const authority = 'rickandmortyapi.com';

  Future<List<Character>> getCharacters() async {
    final uri = Uri.https(authority, '/api/character');
    final result = await http.get(uri);
    final rawResponse = RawApiReponse.fromJson(json.decode(result.body));
    final response = ApiResponse(
      info: rawResponse.info,
      results: rawResponse.results.map((j) => Character.fromJson(j)),
    );
    return response.results.toList();
  }
}

typedef RawApiReponse = ApiResponse<Map<String, dynamic>>;

class ApiResponse<T> {
  final ApiResponseInfo info;
  final Iterable<T> results;

  ApiResponse({required this.info, required this.results});

  ApiResponse.fromJson(Map<String, dynamic> json)
      : info = json['info'],
        results = json['results'];
}

class ApiResponseInfo {
  final int count;
  final int pages;
  final String next;
  final String prev;

  ApiResponseInfo.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        pages = json['pages'],
        next = json['next'],
        prev = json['prev'];
}

class LinkName {
  final String name;
  final String url;

  LinkName.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];
}

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
        episode = json['episode'],
        url = json['url'],
        created = json['created'];
}
