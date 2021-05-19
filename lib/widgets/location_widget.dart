import 'package:flutter/material.dart';
import 'package:flutter_rick/api/domain_models.dart';

class LocationWidget extends StatelessWidget {
  final Location location;

  const LocationWidget(this.location);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(location.name),
    );
  }
}
