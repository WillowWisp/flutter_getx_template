import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_getx_template/common/utility/enums.dart';

part 'todo_dto.g.dart';

@JsonSerializable()
class TodoDto {
  final int id;
  final String name;
  final TodoType type;

  TodoDto({
    required this.id,
    required this.name,
    required this.type,
  });

  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoDtoToJson(this);
}
