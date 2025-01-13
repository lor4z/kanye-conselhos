import 'package:flutter/material.dart';

class KanyeIdeias extends StatelessWidget {
  const KanyeIdeias({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(5, 50, 91, 1),
        body: Center(
          child: Text(
            'KANYE WEST CONSELHOS',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
