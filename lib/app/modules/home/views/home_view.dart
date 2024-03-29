import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
               child: Text("Pindah ke Profile"),
               ),
               SizedBox(height: 10),
               ElevatedButton(
              onPressed: () {
                Get.toNamed('/counter');
              },
               child: Text("Pindah ke Counter"),
               ),
               SizedBox(height: 10),
                ElevatedButton(
              onPressed: () {
                Get.toNamed('/biodata');
              },
               child: Text("Pindah ke Biodata"),
               ),
                SizedBox(height: 10),
                ElevatedButton(
              onPressed: () {
                Get.toNamed('/latihan');
              },
               child: Text("Pindah ke Latihan"),
               ),
               SizedBox(height: 10),
                ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
              },
               child: Text("Pindah ke Login"),
               ),
               SizedBox(height: 10),
                ElevatedButton(
              onPressed: () {
                Get.toNamed('/employe');
              },
               child: Text("Pindah ke employe"),
               ),
          ],
        ),
      ),
    );
  }
}
