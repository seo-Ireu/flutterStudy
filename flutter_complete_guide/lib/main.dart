import 'package:flutter/material.dart';
import './quenstion.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

//ctrl+shift+R : Refactor
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'white', 'score': 10},
        {'text': 'red', 'score': 8},
        {'text': 'green', 'score': 6},
        {'text': 'black', 'score': 4}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'rabbit', 'score': 10},
        {'text': 'lion', 'score': 8},
        {'text': 'snake', 'score': 6},
        {'text': 'elephant', 'score': 4}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor',
      'answer': [
        {'text': 'max', 'score': 10},
        {'text': 'max', 'score': 10},
        {'text': 'max', 'score': 10},
        {'text': 'max', 'score': 10}
      ]
    },
  ];
  var _quenstionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _quenstionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_quenstionIndex < _questions.length) {
      print('We have more questions!');
    }
    setState(() {
      _quenstionIndex = _quenstionIndex + 1;
    });

    print(_quenstionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _quenstionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                quenstionIndex: _quenstionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
