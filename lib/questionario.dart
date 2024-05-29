import 'package:flutter/material.dart';

class Questionario extends StatelessWidget{

  final List<Map<String, Object>> _perguntas;
  final int _perguntaSelecionada;

  Questionario(this._perguntas, this._perguntaSelecionada);

  @override
  Widget build(BuildContext context) {
    return _perguntas[_perguntaSelecionada].cast()['resposta'];
  }
}