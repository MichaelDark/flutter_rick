import 'package:flutter/material.dart';

import 'api/rick_api.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _items = <Character>[];
  late Future<List<Character>> _loadingFuture;

  @override
  void initState() {
    super.initState();
    _loadingFuture = RickApi().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>>(
      future: _loadingFuture,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return CharacterWidget(item);
          },
        );
      },
    );
  }
}

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget(this.character);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(character.name),
    );
  }
}
