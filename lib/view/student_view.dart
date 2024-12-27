import 'package:class_assignment_2/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubitView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  StudentCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Cubit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name input
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Age input
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Address input
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final String name = nameController.text.trim();
                  final String age = ageController.text.trim();
                  final String address = addressController.text.trim();

                  if (name.isNotEmpty && age.isNotEmpty && address.isNotEmpty) {
                    // Add student to the list
                    context.read<StudentCubit>().addStudent(name, age, address);
                    nameController.clear();
                    ageController.clear();
                    addressController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all fields!")),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ),
            SizedBox(height: 20),

            // Display student list
            Expanded(
              child: BlocBuilder<StudentCubit, List<Map<String, String>>>(
                  builder: (context, studentList) {
                if (studentList.isEmpty) {
                  return Center(
                    child: Text("No students added yet"),
                  );
                }
                return ListView.builder(
                  itemCount: studentList.length,
                  itemBuilder: (context, index) {
                    final student = studentList[index];
                    return ListTile(
                      title: Text(student['name'] ?? ''),
                      subtitle: Text(
                          "Age: ${student['age']}, Address: ${student['address']}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Delete student at the given index
                          context.read<StudentCubit>().deleteStudent(index);
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
