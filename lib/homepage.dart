import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/calculator.dart';
import 'package:get_x_demo/custom_paint.dart';
import 'package:get_x_demo/homecontoller.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final controller = Get.put(CounterController());

  static const List<String> _titles = [
    'Homepage',
    'Calculator',
    'Custom Paint',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.currentIndex.value < _titles.length
                ? _titles[controller.currentIndex.value]
                : 'GetX Demo',
          ),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [
            _buildCounterBody(context),
            const CalculatorPage(),
            const CustomPaintPage(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changePage,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.numbers_outlined),
              selectedIcon: Icon(Icons.numbers_rounded),
              label: 'Counter',
            ),
            NavigationDestination(
              icon: Icon(Icons.calculate_outlined),
              selectedIcon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
            NavigationDestination(
              icon: Icon(Icons.palette_outlined),
              selectedIcon: Icon(Icons.palette),
              label: 'Custom Paint',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),
          Obx(
            () => Text(
              '${controller.counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: controller.increment,
                child: const Text('Increment'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: controller.decrement,
                child: const Text('Decrement'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
