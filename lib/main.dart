import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';

main() => runApp(PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'resposta': [
        {'texto': 'Preto', 'ponto': 10},
        {'texto': 'Vemelho', 'ponto': 6},
        {'texto': 'Azul', 'ponto': 5},
        {'texto': 'Rosa', 'ponto': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito ?',
      'resposta': [
        {'texto': 'Coelho', 'ponto': 10},
        {'texto': 'Cobra', 'ponto': 5},
        {'texto': 'Elefante', 'ponto': 6},
        {'texto': 'Leão', 'ponto': 1},
      ]
    },
    {
      'texto': 'Qual seu anime preferido ?',
      'resposta': [
        {'texto': 'Bleach', 'ponto': 8},
        {'texto': 'Naruto', 'ponto': 9},
        {'texto': 'DragonBall', 'ponto': 6},
        {'texto': 'Yu-gi-Oh', 'ponto': 3},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Perguntas'),
              centerTitle: true,
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder,
                  )
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario)));
  }
}

class PerguntasApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
