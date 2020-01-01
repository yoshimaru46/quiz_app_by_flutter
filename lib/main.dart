import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Which is the capital of Japan?',
      'answers': [
        {'text': 'Tokyo', 'score': 1},
        {'text': 'Osaka', 'score': 0},
        {'text': 'Nagoya', 'score': 0},
        {'text': 'Kyoto', 'score': 0},
      ],
    },
    {
      'questionText': '1 + 2 = ?',
      'answers': [
        {'text': '0', 'score': 0},
        {'text': '1', 'score': 0},
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Hello My Quiz App!')),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz, _questions.length),
    ));
  }
}
