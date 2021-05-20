import 'package:flutter/material.dart';

import '../api_rick/models.dart';
import 'entity_list_tile.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget(this.character);

  @override
  Widget build(BuildContext context) {
    return EntityListTile<Character>(
      character,
      imageUrlProvider: (e) => e.image,
      titleProvider: (e) => e.name,
    );
  }
}

class LocationWidget extends StatelessWidget {
  final Location location;

  const LocationWidget(this.location);

  @override
  Widget build(BuildContext context) {
    return EntityListTile<Location>(
      location,
      titleProvider: (e) => e.name,
    );
  }
}

class EpisodeWidget extends StatelessWidget {
  final Episode episode;

  const EpisodeWidget(this.episode);

  @override
  Widget build(BuildContext context) {
    return EntityListTile<Episode>(
      episode,
      titleProvider: (e) => '${e.episode}: ${e.name}',
    );
  }
}
