typedef RawPaginatedReponse = PaginatedResponse<Map<String, dynamic>>;

class PaginatedResponse<T> {
  final PaginatedInfo info;
  final Iterable<T> results;

  PaginatedResponse({
    required this.info,
    required this.results,
  });
}

class PaginatedInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  PaginatedInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
}
