import 'package:auto_route/auto_route.dart';
import 'package:ams_android/blocs/dashboard/dashboard_bloc.dart';
import 'package:ams_android/widgets/dashboardPanelCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/dashBoardBoxCard.dart';
import '../widgets/horizontalCalendar.dart';
import '../widgets/navbar.dart';
import '../widgets/userAppBar.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  static const id = 'dashboardScreen';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(LoadDashboardData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const UserAppbar(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              const HorizontalCalendar(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Today\'s attendance',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Row(
                children: [
                  DashBoardBoxCard(
                    buttonIcon: Icon(Icons.login_rounded),
                    cardTitle: 'Check In',
                    cardDataPrimary: '10:20 am',
                    cardDataSecondary: 'On Time',
                  ),
                  DashBoardBoxCard(
                    buttonIcon: Icon(Icons.logout_rounded),
                    cardTitle: 'Check Out',
                    cardDataPrimary: '07:00 pm',
                    cardDataSecondary: 'Go Home',
                  ),
                ],
              ),
              const Row(
                children: [
                  DashBoardBoxCard(
                    buttonIcon: Icon(Icons.coffee),
                    cardTitle: 'Break Time',
                    cardDataPrimary: '00:30 min',
                    cardDataSecondary: 'Avg Time 30 min',
                  ),
                  DashBoardBoxCard(
                    buttonIcon: Icon(Icons.calendar_month_outlined),
                    cardTitle: 'Total Days',
                    cardDataPrimary: '28',
                    cardDataSecondary: 'Working Days',
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Activity',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    if (state is DashboardLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is DashboardLoaded) {
                      return ListView.builder(
                        itemCount: state.recentAttendance.length,
                        itemBuilder: (context, index) {
                          final attendance = state.recentAttendance[index];
                          return DashBoardPanelCard(
                            buttonIcon: const Icon(Icons.login_rounded),
                            cardTitle: 'Check In',
                            dateText: DateFormat(
                              'MMM dd, yyyy',
                            ).format(attendance.date),
                            timeText: attendance.checkInTime,
                            descText: attendance.status,
                          );
                        },
                      );
                    } else if (state is DashboardError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(child: SizedBox(child: NavBar())),
    );
  }
}
