
import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
  class CalculatorController extends GetxController {
      final num1Controller = TextEditingController();
      final num2Controller = TextEditingController();
    
      final RxDouble result = 0.0.obs;
    
      void add() {
        final n1 = double.tryParse(num1Controller.text) ?? 0;
        final n2 = double.tryParse(num2Controller.text) ?? 0;
        result.value = n1 + n2;
      }
    
      void subtract() {
        final n1 = double.tryParse(num1Controller.text) ?? 0;
        final n2 = double.tryParse(num2Controller.text) ?? 0;
        result.value = n1 - n2;
      }
    
      void multiply() {
        final n1 = double.tryParse(num1Controller.text) ?? 0;
        final n2 = double.tryParse(num2Controller.text) ?? 0;
        result.value = n1 * n2;
      }
    
      void divide() {
        final n1 = double.tryParse(num1Controller.text) ?? 0;
        final n2 = double.tryParse(num2Controller.text) ?? 0;
        result.value = n2 != 0 ? n1 / n2 : 0;
      }
    
      void clear() {
        num1Controller.clear();
        num2Controller.clear();
        result.value = 0.0;
      }
    }
