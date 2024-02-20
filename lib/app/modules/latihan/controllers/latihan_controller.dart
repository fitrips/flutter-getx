import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LatihanController extends GetxController {
  var fullName = ''.obs;
  var placeOfBirth = ''.obs;
  var selectedDate = DateTime.now().obs;
  var jenisKelamin = ''.obs;
  var email = ''.obs;
  var nationally = ''.obs;
  var isRegulerMember = false.obs;
  var isGoldMember = false.obs;
  var isPlatinumMember = false.obs;
  var isVipMember = false.obs;
  var cardNumber = ''.obs;
  var expiredDate = ''.obs;
  var payment = ''.obs;
  var isFormSubmitted = false.obs;

      List<String> selectedMemberships() {
    List<String> memberships = [];

    if (isRegulerMember.value) {
      memberships.add('Reguler');
    }
    if (isGoldMember.value) {
      memberships.add('Gold');
    }
    if (isPlatinumMember.value) {
      memberships.add('Platinum');
    }
    if (isVipMember.value) {
      memberships.add('VIP');
    }

    return memberships;
  }

  void toggleRegulerMember(bool value) {
    isRegulerMember.value = value;
  }

  void toggleGoldMember(bool value) {
    isGoldMember.value = value;
  }

  void togglePlatinumMember(bool value) {
    isPlatinumMember.value = value;
  }

  void toggleVipMember(bool value) {
    isVipMember.value = value;
  }

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  void submitForm() {
    int totalPrice = 0;
    if (isRegulerMember.value) {
      totalPrice = 50000;
    } else if (isGoldMember.value) {
      totalPrice = 150000;
    } else if (isPlatinumMember.value) {
      totalPrice = 250000;
    } else if (isVipMember.value) {
      totalPrice = 500000;
    }

   

      DateTime parsedDate = DateTime.now();
      DateTime newExpiredDate = parsedDate.add(Duration(days: 7));
      expiredDate.value = DateFormat('yyyy-MM-dd').format(newExpiredDate);



    int paymentAmount = int.tryParse(payment.value) ?? 0;

    // Menghitung kembalian 
    int change = paymentAmount - totalPrice;

    String output = 'Total Price: $totalPrice\n';
    output += 'Change: $change';

    print(output);

    // Setting isFormSubmitted flag to true
    isFormSubmitted.value = true;
}
}