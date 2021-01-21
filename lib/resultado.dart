import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return ' Ok, satisfatório.';
    } else if (pontuacao < 12) {
      return 'Muito bom!!';
    } else if (pontuacao < 16) {
      return 'Expert!';
    } else {
      return 'Impossível de bater.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text(
            'Reiniciar ?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
