import 'package:flutter/material.dart';
import 'package:flutter_rick/api/domain_models.dart';

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
