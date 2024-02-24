import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/data/models/employe_model.dart';

class ShowView extends StatelessWidget {
  final Employee employee;

  const ShowView({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${employee.employeName}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Role: ${employee.employeRole}'),
            SizedBox(height: 10),
            Text('Phone Number: ${employee.employePhoneNumber}'),
            // You can add more details here based on your Employee model
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement any action you want when the FAB is pressed
          // For example, you can navigate back to the previous screen
          Get.back();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
