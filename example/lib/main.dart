import 'package:flutter/material.dart';

import 'test_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(alwaysUse24HourFormat: true),
      child: MaterialApp(
        title: 'Sample with AppForm',
        theme: ThemeData.from(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xff572ffe))),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppForm and Flutter Cubit'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: const TestForm(),
        ),
      ),
    );
  }
}
