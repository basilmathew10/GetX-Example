
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('Go back'),
        ),
      ),
    );
  }
}