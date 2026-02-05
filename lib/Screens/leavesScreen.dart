import 'package:ams_android/blocs/leaves/leaves_bloc.dart';

import 'package:ams_android/widgets/leaveElement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/leavesAppbar.dart';
import '../widgets/twoTextCard.dart';

class LeavesScreen extends StatefulWidget {
  static const id = 'leaveScreen';
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LeavesBloc>().add(LoadLeaves());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const LeavesAppBar(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: BlocBuilder<LeavesBloc, LeavesState>(
          builder: (context, state) {
            if (state is LeavesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LeavesLoaded) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 6.0, top: 12.0, bottom: 6.0),
                          child: TwoTextCard(
                            title: 'Leaves Balance',
                            content: state.leaveBalance.toString(),
                            bgColor: Colors.blue.shade100,
                            contentColor: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 6.0, right: 12.0, top: 12.0, bottom: 6.0),
                          child: TwoTextCard(
                            title: 'Leaves Approved',
                            content: state.leavesApproved.toString(),
                            bgColor: Colors.green.shade100,
                            contentColor: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 6.0, top: 6.0, bottom: 12.0),
                          child: TwoTextCard(
                            title: 'Leaves Cancelled',
                            content: state.leavesCancelled.toString(),
                            bgColor: Colors.red.shade100,
                            contentColor: Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 6.0, right: 12.0, top: 6.0, bottom: 12.0),
                          child: TwoTextCard(
                            title: 'Leaves Pending',
                            content: state.leavesPending.toString(),
                            bgColor: Colors.yellow.shade100,
                            contentColor: Colors.yellow.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SegmentedButton<LeaveTimeFilter>(
                    segments: const [
                      ButtonSegment<LeaveTimeFilter>(
                          value: LeaveTimeFilter.past, label: Text('Past')),
                      ButtonSegment<LeaveTimeFilter>(
                          value: LeaveTimeFilter.upcoming,
                          label: Text('Upcoming')),
                      ButtonSegment<LeaveTimeFilter>(
                          value: LeaveTimeFilter.pending,
                          label: Text('Pending'))
                    ],
                    selected: <LeaveTimeFilter>{state.currentFilter},
                    onSelectionChanged: (Set<LeaveTimeFilter> filter) {
                      context
                          .read<LeavesBloc>()
                          .add(FilterLeavesChanged(filter.first));
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.filteredLeaves.length,
                      itemBuilder: (context, index) {
                        final leave = state.filteredLeaves[index];
                        return LeaveElement(
                          buttonIcon: const Icon(Icons.access_alarm),
                          cardTitle: leave.title,
                          timeText: leave.time,
                          dateText:
                              DateFormat('MMM dd, yyyy').format(leave.date),
                          descText: leave.description,
                        );
                      },
                    ),
                  )
                ],
              );
            } else if (state is LeavesError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
