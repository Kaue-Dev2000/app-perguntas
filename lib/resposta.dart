import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final void Function() onResponder;

  Resposta(this.texto, this.onResponder);

  @override
  Widget build(BuildContext condsatext) {

    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onResponder,
        child: Text(texto),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}