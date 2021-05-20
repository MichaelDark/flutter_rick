import 'package:flutter/material.dart';

import '../api_rick/models.dart';
import '../api_rick/rick_api.dart';
import 'entity_list_tiles.dart';
import 'paginated_entity_list_view.dart';

class CharactersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginatedEntityListView<Character>(
      pageFetcher: (page) => RickApi().getPaginatedList<Character>(page: page),
      itemBuilder: (item) => CharacterWidget(item),
    );
  }
}

class LocationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginatedEntityListView<Location>(
      pageFetcher: (page) => RickApi().getPaginatedList(page: page),
      itemBuilder: (item) => LocationWidget(item),
    );
  }
}

class EpisodeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginatedEntityListView<Episode>(
      pageFetcher: (page) => RickApi().getPaginatedList(page: page),
      itemBuilder: (item) => EpisodeWidget(item),
    );
  }
}
