import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employe_controller.dart';

class CreateView extends StatelessWidget {
  final EmployeController employeController = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController roleController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employe'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: roleController,
              decoration: InputDecoration(labelText: 'Role'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Get data from text controllers
                String name = nameController.text;
                String role = roleController.text;
                String phoneNumber = phoneNumberController.text;
 

                // Add employe to the list using the controller
                employeController.addEmployee(
                  employeName: name,
                  employeRole: role,
                  employePhoneNumber: phoneNumber,

                );

                // Clear text controllers
                nameController.clear();
                roleController.clear();
                phoneNumberController.clear();
   

                // Navigate back to the EmployeView
                Get.back();
              },
              child: Text('Add Employe'),
            ),
          ],
        ),
      ),
    );
  }
}