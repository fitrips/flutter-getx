import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;

  void increment() {
    if (count.value >=100) {
      Get.snackbar("error", "jangan terus ditambah");
    } else {
      count.value++;
    }
  }

  void decrement() {
    if (count.value <= 1){
      Get.snackbar("error", "jangan terus dikurang");
    } else {
      count.value--;
    }
  }
}
