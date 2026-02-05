import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/attendance_model.dart';
import '../../models/employee_model.dart';

// Events
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object> get props => [];
}

class LoadDashboardData extends DashboardEvent {}

// States
abstract class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardError extends DashboardState {
  final String message;
  const DashboardError(this.message);
  @override
  List<Object> get props => [message];
}

class DashboardLoaded extends DashboardState {
  final EmployeeModel user;
  final List<AttendanceModel> recentAttendance;

  const DashboardLoaded({required this.user, required this.recentAttendance});

  @override
  List<Object> get props => [user, recentAttendance];
}

// Bloc
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
  }

  Future<void> _onLoadDashboardData(LoadDashboardData event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    try {
      // Mock data loading
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

      emit(DashboardLoaded(user: user, recentAttendance: recentAttendance));
    } catch (e) {
      emit(const DashboardError('Failed to load dashboard data'));
    }
  }
}
