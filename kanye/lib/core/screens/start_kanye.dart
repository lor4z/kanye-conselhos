import 'package:flutter/material.dart';

class StartKanye extends StatelessWidget {
  const StartKanye({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Não tenha medo!'),
          titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          backgroundColor: Color.fromRGBO(5, 50, 91, 1),
          leading: Padding(
            padding: const EdgeInsets.all(6),
            child: Image.asset('assets/images/kanyeHome.png'),
          ),
        ),
        body: Column(
          children: [
            Center(
              heightFactor: 2,
              child: Column(children: [
                Text(
                  'Se você precisa de conselhos,',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(5, 50, 91, 1)),
                ),
                Text(
                  'ESTÁ NO LUGAR CERTO!',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(5, 50, 91, 1)),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Botão clicado!");
                  },
                  child: Text('Me ajude!'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Color.fromRGBO(239, 239, 239, 1)), // Cor de fundo
                    foregroundColor:
                        WidgetStateProperty.all(Colors.black), // Cor do texto
                    textStyle: WidgetStateProperty.all(
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
