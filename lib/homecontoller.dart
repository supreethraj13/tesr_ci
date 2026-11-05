import 'package:get/get.dart';

class CounterController extends GetxController {
  final RxInt counter = 0.obs;
  final RxInt currentIndex = 0.obs;

  void increment() {
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }

  void changePage(int index) {
    currentIndex.value = index;
  }
}