import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_models.dart';
import 'domain_models.dart';

class RickApi {
  static const authority = 'rickandmortyapi.com';

  Future<ApiResponse<Character>> getCharacters({int? page}) async {
    return _getPaginatedList(
      'character',
      converter: (json) => Character.fromJson(json),
    );
  }

  Future<ApiResponse<Location>> getLocations({int? page}) async {
    return _getPaginatedList(
      'location',
      converter: (json) => Location.fromJson(json),
    );
  }

  Future<ApiResponse<Episode>> getEpisodes({int? page}) async {
    return _getPaginatedList(
      'episode',
      converter: (json) => Episode.fromJson(json),
    );
  }

  Future<ApiResponse<T>> _getPaginatedList<T>(
    String path, {
    required T Function(Map<String, dynamic>) converter,
    int? page,
  }) async {
    final hasQuery = page != null;
    final uri = Uri.https(
      authority,
      'api/$path',
      hasQuery
          ? <String, dynamic>{
              if (page != null) 'page': '$page',
            }
          : null,
    );
    final result = await http.get(uri);
    final rawResponse = RawApiReponse.fromJson(json.decode(result.body));
    final response = ApiResponse<T>(
      info: rawResponse.info,
      results: rawResponse.results.map(converter),
    );
    return response;
  }
}
