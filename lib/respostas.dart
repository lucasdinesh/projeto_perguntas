import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onPressed;

  Resposta(this.texto, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(texto),
        color: Colors.blue,
        onPressed: onPressed,
      ),
    );
  }
}
