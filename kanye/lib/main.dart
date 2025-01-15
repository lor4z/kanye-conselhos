import 'package:flutter/material.dart';
import 'package:kanye/core/screens/home.dart';
import 'package:kanye/core/screens/start_kanye.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() =>
      _MyAppState(); // Altere para retornar _MyAppState
}

class _MyAppState extends State<MyApp> {
  // Alterar para corresponder ao MyApp
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
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
      debugShowCheckedModeBanner: false,
      home: isLoading ? KanyeIdeias() : StartKanye(),
    );
  }
}
