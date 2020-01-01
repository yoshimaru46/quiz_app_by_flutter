import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  final int quizSize;

  Result(this.resultScore, this.resetHandler, this.quizSize);

  String get resultPhrase {
    return '${resultScore.toString()} / ${quizSize.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
