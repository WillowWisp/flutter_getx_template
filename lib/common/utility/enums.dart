import 'package:json_annotation/json_annotation.dart';

enum TodoType {
  @JsonValue('standard')
  standard,
  @JsonValue('pomodoro')
  pomododo,
}
