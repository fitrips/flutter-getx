import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/latihan_controller.dart';

class LatihanView extends StatelessWidget {
  LatihanView({Key? key}) : super(key: key);

  final LatihanController latihanController = LatihanController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatihanView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Full Name'),
                      onChanged: (value) =>
                          latihanController.fullName.value = value,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Place of Birth'),
                      onChanged: (value) =>
                          latihanController.placeOfBirth.value = value,
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => latihanController.selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          hintText: 'Pick Date',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Date of Birth:'),
                            Obx(() => Text(
                                  DateFormat('yyyy-MM-dd')
                                      .format(latihanController.selectedDate.value),
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Laki-laki',
                              groupValue:
                                  latihanController.jenisKelamin.value,
                              onChanged: (value) =>
                                  latihanController.jenisKelamin.value = value!,
                            )),
                        Text('Laki-laki'),
                        Obx(() => Radio(
                              value: 'Perempuan',
                              groupValue:
                                  latihanController.jenisKelamin.value,
                              onChanged: (value) =>
                                  latihanController.jenisKelamin.value = value!,
                            )),
                        Text('Perempuan'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) =>
                          latihanController.email.value = value,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nationally'),
                      onChanged: (value) =>
                          latihanController.nationally.value = value,
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Obx(() => Checkbox(
                          value: latihanController.isRegulerMember.value,
                          onChanged: (value) => latihanController.isRegulerMember.value = value!,
                        )),
                        
                        Text('Reguler'),
                        Obx(() => Checkbox(
                          value: latihanController.isGoldMember.value,
                          onChanged: (value) => latihanController.isGoldMember.value = value!,
                        )),
                        
                        Text('Gold'),
                        Obx(() => Checkbox(
                          value: latihanController.isPlatinumMember.value,
                          onChanged: (value) => latihanController.isPlatinumMember.value = value!,
                        )),
                        
                        Text('Platinum'),
                        Obx(() => Checkbox(
                          value: latihanController.isVipMember.value,
                          onChanged: (value) => latihanController.isVipMember.value = value!,
                        )),
                        Text('VIP'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Card Number'),
                      onChanged: (value) => latihanController.cardNumber.value = value,
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Payment'),
                            onChanged: (value) => latihanController.payment.value = value,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => latihanController.submitForm(),
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Obx(() {
                if (latihanController.isFormSubmitted.value) {
                final age = DateTime.now().year -
                latihanController.selectedDate.value.year;

 
               String output  = 'Output: ${latihanController.fullName.value}, ${latihanController.placeOfBirth.value}, Date of Birth: ${DateFormat('yyyy-MM-dd').format(latihanController.selectedDate.value)}, Age: $age, ${latihanController.jenisKelamin.value}, ${latihanController.email.value}, ${latihanController.nationally.value}';
            
              List<String> memberships = latihanController.selectedMemberships();


              if (memberships.isNotEmpty) {
              output += '\nMembership: ${memberships.join(',')}';


             for (String membership in memberships) {
               if (membership == 'Reguler') {
               output += '\nAnggota: 1 bulan';
               } else if (membership == 'Gold') {
               output += '\nAnggota: 1 bulan';
              output += '\nBenefits: Cemilan Gratis';
              } else if (membership == 'Platinum') {
              output += '\nAnggota: 2 bulan';
              output += '\nBenefits: Cemilan Gratis, Free Wifi';
              } else if (membership == 'VIP') {
              output += '\nAnggota: 3 bulan';
              output += '\nBenefits: Cemilan Gratis, Free Wifi, Tiket Konser';
    }
  }
}
               
               if (latihanController.payment.value.isNotEmpty) {
                output += '\nCard Number: ${latihanController.cardNumber.value}\n';
                output += 'Expired Date: ${latihanController.expiredDate.value}\n';
                output += 'Payment: ${latihanController.payment.value}';


               int totalPrice = 0;
               if (latihanController.isRegulerMember.value) {
                 totalPrice = 50000;
             } else if (latihanController.isGoldMember.value) {
                 totalPrice = 150000;
             } else if (latihanController.isPlatinumMember.value) {
                 totalPrice = 250000;
             } else if (latihanController.isVipMember.value) {
                totalPrice = 500000;
             }


            output += '\nTotal Price: $totalPrice';


             int paymentAmount = int.tryParse(latihanController.payment.value) ?? 0;
             int change = paymentAmount - totalPrice;

              output += '\nChange: $change';
            }

    return Text(
      output,
      style: TextStyle(fontSize: 16.0),
    );
  } else {
    return SizedBox.shrink();
  }
}),
            ],
          ),
        ),
      ),
    );
  }
}