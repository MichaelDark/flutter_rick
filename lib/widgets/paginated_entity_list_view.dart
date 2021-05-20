import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../api_rick/models.dart';

class PaginatedEntityListView<T> extends StatefulWidget {
  final Future<ApiResponse<T>> Function(int pageKey) pageFetcher;
  final Widget Function(T) itemBuilder;

  const PaginatedEntityListView({
    Key? key,
    required this.pageFetcher,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  _PaginatedEntityListViewState<T> createState() =>
      _PaginatedEntityListViewState<T>();
}

class _PaginatedEntityListViewState<T>
    extends State<PaginatedEntityListView<T>> {
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newResponse = await widget.pageFetcher.call(pageKey);
      final isLastPage = newResponse.info.next == null;
      if (isLastPage) {
        _pagingController.appendLastPage(newResponse.results.toList());
      } else {
        _pagingController.appendPage(newResponse.results.toList(), pageKey + 1);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: (context, item, index) => widget.itemBuilder.call(item),
      ),
    );
  }
}
