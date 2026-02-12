import 'package:ams_android/models/attendance_model.dart';
import 'package:ams_android/models/employee_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'dashboard_state.g.dart';

@CopyWith()
class DashboardState {
  final bool isLoading;
  final user = EmployeeModel(
    id: 1,
    name: 'Employee Name',
    role: 'Employee',
    active: true,
  );

  final recentAttendance = [
    AttendanceModel(
      date: DateTime.now(),
      checkInTime: '10:20 am',
      checkOutTime: '07:00 pm',
      status: 'On Time',
    ),
    AttendanceModel(
      date: DateTime.now().subtract(const Duration(days: 1)),
      checkInTime: '10:15 am',
      checkOutTime: '07:10 pm',
      status: 'On Time',
    ),
  ];
   DashboardState({this.isLoading = false});
}