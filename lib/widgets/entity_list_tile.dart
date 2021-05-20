import 'package:flutter/material.dart';

class EntityListTile<T> extends StatelessWidget {
  final T item;
  final String Function(T)? imageUrlProvider;
  final String Function(T) titleProvider;

  const EntityListTile(
    this.item, {
    this.imageUrlProvider,
    required this.titleProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrlProvider != null)
            Image.network(
              imageUrlProvider!(item),
              height: 128,
              width: 128,
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(titleProvider(item)),
            ),
          ),
        ],
      ),
    );
  }
}
