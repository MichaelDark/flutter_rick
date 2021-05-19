import 'package:flutter/material.dart';
import 'package:flutter_rick/widgets/episode_widget.dart';

import '../api/domain_models.dart';
import '../api/rick_api.dart';
import 'character_widget.dart';
import 'location_widget.dart';
import 'paginated_entity_list_view.dart';

class CharactersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginatedEntityListView<Character>(
      pageFetcher: (page) => RickApi().getCharacters(page: page),
      itemBuilder: (item) => CharacterWidget(item),
    );
  }
}

class LocationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginatedEntityListView<Location>(
      pageFetcher: (page) => RickApi().getLocations(page: page),
      itemBuilder: (item) => LocationWidget(item),
    );
  }
}

class EpisodeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginatedEntityListView<Episode>(
      pageFetcher: (page) => RickApi().getEpisodes(page: page),
      itemBuilder: (item) => EpisodeWidget(item),
    );
  }
}
