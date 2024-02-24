
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfilController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
        actions: [
          IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => controller.logout(),
        ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : Padding (
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8,),
              Text(
                'Nama: ${controller.user['name']}',
                style: TextStyle(fontSize: 18),
              ),
               SizedBox(height: 8,),
              Text(
                'email: ${controller.user['email']}',
                style: TextStyle(fontSize: 18),
              ),
               SizedBox(height: 8,),
              Text(
                'role: ${controller.user['role']}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        )
        ),
    );
  }
}