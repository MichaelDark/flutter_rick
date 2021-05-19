import 'parsing_extensions.dart';

typedef RawApiReponse = ApiResponse<Map<String, dynamic>>;

class ApiResponse<T> {
  final ApiResponseInfo info;
  final Iterable<T> results;

  ApiResponse({required this.info, required this.results});

  ApiResponse.fromJson(Map<String, dynamic> json)
      : info = ApiResponseInfo.fromJson(json['info']),
        results = json.parseIterable<T>('results');
}

class ApiResponseInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

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
