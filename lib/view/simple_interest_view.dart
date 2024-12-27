import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  _SimpleInterestViewState createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers to prevent memory leaks
    _principalController.dispose();
    _rateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the SimpleInterestCubit from BlocProvider
    final simpleInterestCubit = BlocProvider.of<SimpleInterestCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Principal input field
            TextField(
              controller: _principalController,
              decoration: InputDecoration(
                labelText: 'Principal (P)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Rate input field
            TextField(
              controller: _rateController,
              decoration: InputDecoration(
                labelText: 'Rate of Interest (R%)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Time input field
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Time (T in years)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Calculate button
            ElevatedButton(
              onPressed: () {
                // Retrieve values from the text fields
                final principal =
                    double.tryParse(_principalController.text) ?? 0;
                final rate = double.tryParse(_rateController.text) ?? 0;
                final time = double.tryParse(_timeController.text) ?? 0;

                // Pass values to the cubit for calculation
                simpleInterestCubit.calculateInterest(principal, rate, time);
              },
              child: Text('Calculate Simple Interest'),
            ),
            SizedBox(height: 16),

            // Display the result using BlocBuilder
            BlocBuilder<SimpleInterestCubit, double>(
              builder: (context, interest) {
                return Text(
                  'Simple Interest: ${interest.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
