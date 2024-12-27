import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/area_of_circle_cubit.dart';

class AreaOfCircleView extends StatelessWidget {
  const AreaOfCircleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final areaOfCircleCubit = BlocProvider.of<AreaOfCircleCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Area of Circle Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Radius'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                // Add logic to handle radius value change
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Call the Cubit to calculate area of the circle
                double radius = 7; // replace with user input
                areaOfCircleCubit.calculateArea(radius);
              },
              child: Text("Calculate"),
            ),
            BlocBuilder<AreaOfCircleCubit, double>(
              builder: (context, area) {
                return Text('Area of Circle: $area');
              },
            ),
          ],
        ),
      ),
    );
  }
}
