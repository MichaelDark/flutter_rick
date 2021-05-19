import 'package:flutter/material.dart';
import 'package:flutter_rick/api/domain_models.dart';

class EpisodeWidget extends StatelessWidget {
  final Episode episode;

  const EpisodeWidget(this.episode);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(episode.name),
    );
  }
}
