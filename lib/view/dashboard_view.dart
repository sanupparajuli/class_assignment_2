import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/dashboard_cubit.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access DashboardCubit using BlocProvider
    final dashboardCubit = BlocProvider.of<DashboardCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sanup's Class Assignment 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => dashboardCubit.openSimpleInterestView(context),
            child: Text("Simple Interest"),
          ),
          ElevatedButton(
            onPressed: () => dashboardCubit.openAreaOfCircleView(context),
            child: Text("Area of Circle"),
          ),
          ElevatedButton(
            onPressed: () => dashboardCubit.openStudentCubitView(context),
            child: Text("Student"),
          ),
        ],
      ),
    );
  }
}
