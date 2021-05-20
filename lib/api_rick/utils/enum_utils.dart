import 'package:collection/collection.dart';
import 'package:recase/recase.dart';

String enumToString<TEnum>(TEnum enumValue) {
  if (enumValue == null) return '';
  final String description = enumValue.toString();
  final int indexOfDot = description.indexOf('.');
  assert(
    indexOfDot != -1 && indexOfDot < description.length - 1,
    'The provided object "$enumValue" is not an enum.',
  );
  return description.substring(indexOfDot + 1);
}

/// Convert string to enum value
TEnum enumFromString<TEnum>(
  String? key,
  List<TEnum> enumValues,
  TEnum defaultValue,
) {
  return enumFromStringOrNull(key, enumValues) ?? defaultValue;
}

/// Convert string to enum value
TEnum? enumFromStringOrNull<TEnum>(
  String? key,
  List<TEnum> enumValues,
) {
  return enumValues.firstWhereOrNull((value) {
    final possibleCases = [
      enumToString(value).camelCase,
      enumToString(value).snakeCase,
    ];
    return possibleCases.contains(key);
  });
}
