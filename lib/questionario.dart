import 'package:flutter/material.dart';
import 'questao.dart';

import 'resposta.dart';

class Questionario extends StatelessWidget {
  
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() onResponder;

  Questionario({
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.onResponder
    });

  @override
  Widget build(BuildContext context) {

    List<String>? resposta = perguntas[perguntaSelecionada].cast()['resposta'];

    return Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]['texto'].toString()),
            ...resposta!.map((t) => Resposta(t, onResponder)),
          ],
        );
  }
}