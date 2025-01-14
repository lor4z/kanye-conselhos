import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Biblioteca para requisição HTTP
import 'dart:convert'; // Para processar a resposta da API

class StartKanye extends StatefulWidget {
  const StartKanye({super.key});

  @override
  State<StartKanye> createState() => _StartKanyeState();
}

class _StartKanyeState extends State<StartKanye> {
  String apiResponse = "Aguardando conselho..."; // Texto inicial da caixa
  String translatedResponse = "Tradução aparecerá aqui";

  // Função para buscar a frase da API
  Future<void> fetchAdvice() async {
    try {
      final response = await http.get(Uri.parse("https://api.kanye.rest"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          apiResponse = data['quote']; // Atualiza o texto com a frase recebida
          translatedResponse = "Tradução aparecerá aqui";
        });
      } else {
        setState(() {
          apiResponse = "Erro ao carregar conselho.";
        });
      }
    } catch (e) {
      setState(() {
        apiResponse = "Erro de conexão.";
      });
    }
  }

  Future<void> translatedText() async {
    try {
      final response = await http.post(
        Uri.parse("https://pt.libretranslate.com/translate"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "q": apiResponse,
          "source": "en",
          "target": "pt",
          "format": "text",
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          translatedResponse = data['translatedText'];
        });
      } else {
        setState(() {
          translatedResponse = "Erro ao traduzir.";
        });
      }
    } catch (e) {
      setState(() {
        translatedResponse = "Erro de tradução";
      });
    }
  }

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
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
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: fetchAdvice,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromRGBO(239, 239, 239, 1), // Cor de fundo
                  foregroundColor: Colors.black, // Cor do texto
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ), // Chama a função para buscar o conselho
                child: Text('Me ajude!'),
              ),
              SizedBox(height: 30),
              Image.asset('assets/images/kanye.png'),
              SizedBox(height: 100),
              // Caixa para exibir o texto da API
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  apiResponse,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: translatedText,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 192, 192, 192),
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                child: Text("Traduzir"),
              ),
              SizedBox(height: 20),
              // Caixa para exibir o texto traduzido
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  translatedResponse,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
