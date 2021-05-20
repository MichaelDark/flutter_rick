import 'dart:convert';

import 'package:http/http.dart' as http;

import 'entity_type_utils.dart';
import 'models.dart';

class RickApi {
  static const authority = 'rickandmortyapi.com';

  Future<ApiResponse<T>> getPaginatedList<T>({
    int? page,
  }) async {
    final type = getEntityTypeFromType<T>();
    final hasQuery = page != null;
    final uri = Uri.https(
      authority,
      'api/${type.path}',
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
      results: rawResponse.results.map(type.getConverter()),
    );
    return response;
  }
}
