import 'package:flutter/material.dart';
import './quenstion.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int quenstionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.quenstionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text(quenstions.elementAt(0),),
        //Text(questions[_quenstionIndex]),
        Question(
          questions[quenstionIndex]['questionText'] as String,
        ),
        ...(questions[quenstionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
