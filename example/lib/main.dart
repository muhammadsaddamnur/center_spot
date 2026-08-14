import 'package:center_spot/center_spot.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => CenterSpot(
        enabled: true,
        preset: ViewportPresets.mediumPhone,
        child: child!,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Center Spot')),
        body: const Center(child: Text('390 × 844 logical pixels')),
      ),
    );
  }
}
