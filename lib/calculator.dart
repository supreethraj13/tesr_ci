import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/calculator_controller.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalculatorController());

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.num1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'First Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.num2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Second Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => Text(
                  'Result: ${controller.result.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: controller.add,
                    child: const Text('Add (+)'),
                  ),
                  ElevatedButton(
                    onPressed: controller.subtract,
                    child: const Text('Sub (-)'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: controller.multiply,
                    child: const Text('Mul (×)'),
                  ),
                  ElevatedButton(
                    onPressed: controller.divide,
                    child: const Text('Div (÷)'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: controller.clear,
                child: const Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
