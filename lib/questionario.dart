import 'package:flutter/material.dart';
import 'questao.dart';

import 'resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) onResponder;

  Questionario(
      {required this.perguntaSelecionada,
      required this.perguntas,
      required this.onResponder});

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? resposta =
        perguntas[perguntaSelecionada].cast()['resposta'];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...resposta!.map((resposta) {
          return Resposta(resposta['texto'] as String,
              () => onResponder(int.parse(resposta['pontuacao'].toString())));
        })
      ],
    );
  }
}
