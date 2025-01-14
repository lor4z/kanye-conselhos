import 'package:flutter/material.dart';
import 'package:kanye/core/screens/home.dart';
import 'package:kanye/core/screens/start_kanye.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StartKanye> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StartKanye> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        // Verifica se o widget ainda está montado
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoading ? KanyeIdeias() : StartKanye(),
    );
  }
}
