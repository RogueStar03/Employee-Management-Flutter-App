// employee.dart
import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

@JsonSerializable()
class EmployeeModel {
  final int id;
  final String name;
  final String role;
  final bool active;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.role,
    required this.active,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}
