// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoDto _$TodoDtoFromJson(Map<String, dynamic> json) {
  return TodoDto(
    id: json['id'] as int,
    name: json['name'] as String,
    type: _$enumDecode(_$TodoTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$TodoDtoToJson(TodoDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$TodoTypeEnumMap[instance.type],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$TodoTypeEnumMap = {
  TodoType.standard: 'standard',
  TodoType.pomododo: 'pomodoro',
};
