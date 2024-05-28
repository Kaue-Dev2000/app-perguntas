import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import './questao.dart';

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
    
  List<String>? resposta = _temPerguntaSelecionada ? _perguntas[_perguntaSelecionada].cast()['resposta'] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: _temPerguntaSelecionada ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
            ...resposta!.map((t) => Resposta(t, _responder)).toList(),
          ],
        ) : null,
      ),
    );
  }
}