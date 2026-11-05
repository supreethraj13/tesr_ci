import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/homecontoller.dart';
import 'package:get_x_demo/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Reset Get instance before test
    Get.reset();

    await tester.pumpWidget(const MyApp());

    final controller = Get.find<CounterController>();
    expect(controller.counter.value, 0);

    // Tap the increment button
    await tester.tap(find.text('Increment'));
    await tester.pump();

    expect(controller.counter.value, 1);
  });
}
