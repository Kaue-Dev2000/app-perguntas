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
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const[
      {
        'texto': 'Qual é a sua cor favorita?',
        'resposta': [
          {'texto': 'Preto', 'pontuacao': 10},
          {'texto': 'Vermelho', 'pontuacao': 5},
          {'texto': 'Verde', 'pontuacao': 3},
          {'texto': 'Branco', 'pontuacao': 1},
        ]
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': [
          {'texto': 'Coelho', 'pontuacao': 10},
          {'texto': 'Cobra', 'pontuacao': 5},
          {'texto': 'Elefante', 'pontuacao': 3},
          {'texto': 'Leão','pontuacao': 1},
        ],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'resposta': [
          {'texto': 'Maria', 'pontuacao': 10,},
          {'texto': 'João', 'pontuacao': 5,},
          {'texto': 'Léo', 'pontuacao': 3,},
          {'texto': 'Pedro', 'pontuacao': 1,},
        ],
      },
  ];

  void _onResponder(int pontuacao) {
    setState(() {
    _perguntaSelecionada++;
    _pontuacaoTotal += pontuacao;
    });
    print(_pontuacaoTotal);
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
          onResponder:  _onResponder
        ) : Resultado(_pontuacaoTotal),
      ),
    );
  }
}