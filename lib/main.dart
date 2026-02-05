import 'package:ams_android/Screens/dashboardScreen.dart';
import 'package:ams_android/Screens/leavesScreen.dart';
import 'package:ams_android/Screens/logInScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ams_android/blocs/login/login_bloc.dart';
import 'package:ams_android/blocs/dashboard/dashboard_bloc.dart';
import 'package:ams_android/blocs/leaves/leaves_bloc.dart';

void main() => runApp(const AmsApp());

class AmsApp extends StatelessWidget {
  const AmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => DashboardBloc()),
        BlocProvider(create: (_) => LeavesBloc()),
      ],
      child: MaterialApp(
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          DashboardScreen.id: (context) => const DashboardScreen(),
          LeavesScreen.id: (context) => const LeavesScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
