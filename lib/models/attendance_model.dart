class AttendanceModel {
  final DateTime date;
  final String checkInTime;
  final String checkOutTime;
  final String status; // e.g., "On Time", "Late"

  AttendanceModel({
    required this.date,
    required this.checkInTime,
    required this.checkOutTime,
    required this.status,
  });
}
