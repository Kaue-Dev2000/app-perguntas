import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{

  final int _pontuacaoTotal;

  Resultado(this._pontuacaoTotal);

  String get fraseResultado {
    if(_pontuacaoTotal < 8) {
      return 'Parabéns!';
    }
    else if(_pontuacaoTotal < 12) {
      return 'Você é bom!';
    }
    else if(_pontuacaoTotal < 16) {
      return 'Impressionante';
    }
    else {
      return 'Perfeito';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseResultado,
        style: TextStyle(fontSize: 28.0),
      ),
    );
  }
  
}