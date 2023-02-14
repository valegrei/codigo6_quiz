import 'package:codigo6_quiz/pages/question.dart';
import 'package:flutter/material.dart';

class QuizBrain {
  final List<Question> _questions = [
    Question(questionText: "¿He dormido 8 horas?", questionAnswer: false),
    Question(questionText: "¿La Tierra es plana?", questionAnswer: false),
    Question(questionText: "¿Taiwan es un país?", questionAnswer: true),
    Question(questionText: "¿El hombre fue a la Luna?", questionAnswer: true),
    Question(questionText: "¿He almorzado hoy?", questionAnswer: true),
  ];

  List<Widget> scoreKeeper = [];

  int _questionNumber = 0;

  //Funcion que devuelva el texto de una pregunta de acuerdo a su posicion
  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  //Funcion que devuelva la respuesta de una pregunta de acuerdo a su posicion
  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  //
  void nextQuestion() {
    _questionNumber++;
  }

  void verifyAnswer(BuildContext context, bool type) {
    bool correctAnswer = getQuestionAnswer();
    if (correctAnswer == type) {
      scoreKeeper.add(const Icon(
        Icons.check,
        color: Color(0xff06d6a0),
      ));
    } else {
      scoreKeeper.add(const Icon(
        Icons.close,
        color: Color(0xffef476f),
      ));
    }
    nextQuestion();
  }

  bool isFinished() {
    return _questionNumber >= _questions.length - 1;
  }

  void restart(){
    _questionNumber = 0;
    scoreKeeper.clear();
  }
}
