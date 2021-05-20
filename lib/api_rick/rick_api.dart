import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/entity_type.dart';
import 'models/pagination.dart';
import 'models/parser.dart';

class RickApi {
  static const authority = 'rickandmortyapi.com';
  static const parser = Parser();

  Future<PaginatedResponse<T>> getPaginatedList<T>({
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
    final rawResponse = parser.parserPaginatedResponse<Map<String, dynamic>>(
      json.decode(result.body),
    );
    final response = PaginatedResponse<T>(
      info: rawResponse.info,
      results: rawResponse.results.map(type.getParser()),
    );
    return response;
  }
}
