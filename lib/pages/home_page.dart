import 'package:flutter/material.dart';
import 'package:flutter_rick/api/domain_models.dart';

import '../widgets/paginated_lists.dart';

extension on EntityType {
  Widget buildPage() {
    switch (this) {
      case EntityType.character:
        return CharactersList();
      case EntityType.location:
        return LocationList();
      case EntityType.episode:
        return EpisodeList();
    }
  }

  Widget buildIcon() {
    switch (this) {
      case EntityType.character:
        return Icon(Icons.person);
      case EntityType.location:
        return Icon(Icons.location_on);
      case EntityType.episode:
        return Icon(Icons.movie_creation_outlined);
    }
  }

  String get name {
    switch (this) {
      case EntityType.character:
        return 'Characters';
      case EntityType.location:
        return 'Locations';
      case EntityType.episode:
        return 'Episodes';
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EntityType _entityType = EntityType.character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _entityType.buildPage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) => setState(() => _entityType = EntityType.values[i]),
        currentIndex: EntityType.values.indexOf(_entityType),
        items: [
          ...EntityType.values.map(
            (e) => BottomNavigationBarItem(
              label: e.name,
              icon: e.buildIcon(),
            ),
          ),
        ],
      ),
    );
  }
}
