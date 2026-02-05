import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/leave_model.dart';

enum LeaveTimeFilter { past, upcoming, pending }

// Events
abstract class LeavesEvent extends Equatable {
  const LeavesEvent();
  @override
  List<Object> get props => [];
}

class LoadLeaves extends LeavesEvent {}

class FilterLeavesChanged extends LeavesEvent {
  final LeaveTimeFilter filter;
  const FilterLeavesChanged(this.filter);
  @override
  List<Object> get props => [filter];
}

// States
abstract class LeavesState extends Equatable {
  const LeavesState();
  @override
  List<Object> get props => [];
}

class LeavesInitial extends LeavesState {}

class LeavesLoading extends LeavesState {}

class LeavesError extends LeavesState {
  final String message;
  const LeavesError(this.message);
  @override
  List<Object> get props => [message];
}

class LeavesLoaded extends LeavesState {
  final List<LeaveModel> allLeaves;
  final List<LeaveModel> filteredLeaves;
  final LeaveTimeFilter currentFilter;
  final int leaveBalance;
  final int leavesApproved;
  final int leavesCancelled;
  final int leavesPending;

  const LeavesLoaded({
    required this.allLeaves,
    required this.filteredLeaves,
    required this.currentFilter,
    required this.leaveBalance,
    required this.leavesApproved,
    required this.leavesCancelled,
    required this.leavesPending,
  });

  @override
  List<Object> get props => [
        allLeaves,
        filteredLeaves,
        currentFilter,
        leaveBalance,
        leavesApproved,
        leavesCancelled,
        leavesPending
      ];

  LeavesLoaded copyWith({
    List<LeaveModel>? allLeaves,
    List<LeaveModel>? filteredLeaves,
    LeaveTimeFilter? currentFilter,
    int? leaveBalance,
    int? leavesApproved,
    int? leavesCancelled,
    int? leavesPending,
  }) {
    return LeavesLoaded(
      allLeaves: allLeaves ?? this.allLeaves,
      filteredLeaves: filteredLeaves ?? this.filteredLeaves,
      currentFilter: currentFilter ?? this.currentFilter,
      leaveBalance: leaveBalance ?? this.leaveBalance,
      leavesApproved: leavesApproved ?? this.leavesApproved,
      leavesCancelled: leavesCancelled ?? this.leavesCancelled,
      leavesPending: leavesPending ?? this.leavesPending,
    );
  }
}

// Bloc
class LeavesBloc extends Bloc<LeavesEvent, LeavesState> {
  LeavesBloc() : super(LeavesInitial()) {
    on<LoadLeaves>(_onLoadLeaves);
    on<FilterLeavesChanged>(_onFilterLeavesChanged);
  }

  Future<void> _onLoadLeaves(
      LoadLeaves event, Emitter<LeavesState> emit) async {
    emit(LeavesLoading());
    try {
      final allLeaves = [
        LeaveModel(
          id: '1',
          title: 'Sick Leave',
          date: DateTime.now().add(const Duration(days: 2)),
          time: 'Full Day',
          description: 'Feeling unwell',
          status: LeaveStatus.approved,
          type: LeaveType.sick,
        ),
        LeaveModel(
          id: '2',
          title: 'Casual Leave',
          date: DateTime.now().subtract(const Duration(days: 5)),
          time: 'Full Day',
          description: 'Personal work',
          status: LeaveStatus.approved,
          type: LeaveType.casual,
        ),
        LeaveModel(
          id: '3',
          title: 'Urgent Leave',
          date: DateTime.now().add(const Duration(days: 10)),
          time: 'Full Day',
          description: 'Family emergency',
          status: LeaveStatus.pending,
          type: LeaveType.earned,
        ),
      ];

      final balance = 20;
      final approved =
          allLeaves.where((l) => l.status == LeaveStatus.approved).length;
      final cancelled =
          allLeaves.where((l) => l.status == LeaveStatus.cancelled).length;
      final pending =
          allLeaves.where((l) => l.status == LeaveStatus.pending).length;

      // Default filter: Upcoming
      final filter = LeaveTimeFilter.upcoming;
      final filtered = _filterLeaves(allLeaves, filter);

      emit(LeavesLoaded(
        allLeaves: allLeaves,
        filteredLeaves: filtered,
        currentFilter: filter,
        leaveBalance: balance,
        leavesApproved: approved,
        leavesCancelled: cancelled,
        leavesPending: pending,
      ));
    } catch (e) {
      emit(const LeavesError('Failed to load leaves'));
    }
  }

  void _onFilterLeavesChanged(
      FilterLeavesChanged event, Emitter<LeavesState> emit) {
    if (state is LeavesLoaded) {
      final currentState = state as LeavesLoaded;
      final filtered = _filterLeaves(currentState.allLeaves, event.filter);
      emit(currentState.copyWith(
        filteredLeaves: filtered,
        currentFilter: event.filter,
      ));
    }
  }

  List<LeaveModel> _filterLeaves(
      List<LeaveModel> leaves, LeaveTimeFilter filter) {
    switch (filter) {
      case LeaveTimeFilter.past:
        return leaves.where((l) => l.date.isBefore(DateTime.now())).toList();
      case LeaveTimeFilter.upcoming:
        return leaves
            .where((l) =>
                l.date.isAfter(DateTime.now()) &&
                l.status == LeaveStatus.approved)
            .toList();
      case LeaveTimeFilter.pending:
        return leaves.where((l) => l.status == LeaveStatus.pending).toList();
    }
  }
}
