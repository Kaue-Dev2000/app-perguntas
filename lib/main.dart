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
        'resposta': [
          {'texto': 'Preto', 'nota': 10},
          {'texto': 'Vermelho', 'nota': 5},
          {'texto': 'Verde', 'nota': 3},
          {'texto': 'Branco', 'nota': 1},
        ]
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': [
          {'texto': 'Coelho', 'nota': 10},
          {'texto': 'Cobra', 'nota': 10},
          {'texto': 'Elefante', 'nota': 10},
          {'texto': 'Leão','nota': 10},
        ],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'resposta': [
          {'texto': 'Maria', 'nota': 10,},
          {'texto': 'João', 'nota': 5,},
          {'texto': 'Léo', 'nota': 3,},
          {'texto': 'Pedro', 'nota': 1,},
        ],
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