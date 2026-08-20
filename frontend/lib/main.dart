import 'package:flutter/material.dart';

void main() {
  runApp(const DekioApp());
}

class DekioApp extends StatelessWidget {
  const DekioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEKIO',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const SizedBox.expand(),
      ),
    );
  }
}