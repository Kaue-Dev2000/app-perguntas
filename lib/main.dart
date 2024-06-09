import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget{

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}

class PerguntaAppState extends State<PerguntaApp> {

  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const[
      {
        'texto': 'Qual é a sua cor favorita?',
        'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco',],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão',],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'resposta': ['Maria', 'João', 'Léo', 'Pedro',],
      },
  ];

  void _responder() {
    setState(() {
    _perguntaSelecionada++;
    });
  }

  bool get _temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context){

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          foregroundColor: Colors.white,
        ),
        body: _temPerguntaSelecionada ? Questionario(
          perguntaSelecionada:  _perguntaSelecionada,
          perguntas: _perguntas,
          onResponder:  _responder
        ) : Resultado(),
      ),
    );
  }
}