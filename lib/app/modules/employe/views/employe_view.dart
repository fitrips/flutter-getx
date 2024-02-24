import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/employe/views/create_view.dart';
import '../controllers/employe_controller.dart';

class EmployeView extends GetView<EmployeController> {
  const EmployeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmployeController controller = Get.put(EmployeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.employeeList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  DataTable(
                    columnSpacing: 10, // Sesuaikan dengan jarak yang diinginkan antara kolom
                    columns: [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Role')),
                      DataColumn(label: Text('Phone Number')),
                      // DataColumn(label: Text('Address')),
                      DataColumn(label: Text('Actions')), // Kolom baru untuk tombol aksi
                    ],
                    rows: controller.employeeList
                        .map(
                          (employee) => DataRow(
                            cells: [
                              DataCell(Text(employee.employeName.toString())),
                              DataCell(Text(employee.employeRole.toString())),
                              DataCell(
                                  Text(employee.employePhoneNumber.toString())),
                              // DataCell(Text(employee.employeAddress.toString())),
                              DataCell(
                                Row(
                                  children: [
                                    buildIconButton(
                                      icon: Icons.edit,
                                      color: Colors.purple,
                                      onPressed: () {
                                        // Implementasi logika edit di sini
                                        print('Edit button pressed for ${employee.employeName}');
                                      },
                                    ),
                                    buildIconButton(
                                      icon: Icons.visibility,
                                      color: Colors.purple,
                                      onPressed: () {
                                        // Implementasi logika show di sini
                                        print('Show button pressed for ${employee.employeName}');
                                      },
                                    ),
                                    buildIconButton(
                                      icon: Icons.delete,
                                      color: Colors.purple,
                                      onPressed: () {
                                        // Implementasi logika delete di sini
                                        print('Delete button pressed for ${employee.employeName}');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Pindah ke halaman tambah data
          Get.to(() => CreateView());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4), // Sesuaikan dengan jarak yang diinginkan
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
        iconSize: 18, // Sesuaikan dengan ukuran yang diinginkan
      ),
    );
  }
}