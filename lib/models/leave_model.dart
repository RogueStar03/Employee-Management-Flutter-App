enum LeaveStatus { approved, cancelled, pending }

enum LeaveType { sick, casual, earned }

class LeaveModel {
  final String id;
  final String title;
  final DateTime date;
  final String time;
  final String description;
  final LeaveStatus status;
  final LeaveType type;

  LeaveModel({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.description,
    required this.status,
    required this.type,
  });
}
