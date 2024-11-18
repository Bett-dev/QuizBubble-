import 'package:bubblequiz/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

import 'question.dart';

class QuizBank {
  int questionNumber = 0;
  final List<Question> _questionBank = [
    Question(
        'Bubble.io is a no-code platform that allows users to build fully functional web applications without writing any code.',
        true),
    Question(
        'In Bubble.io, workflows can only be triggered by user interactions such as button clicks or page loads.',
        false),
    Question(
        'Bubble.io provides a built-in database where users can store and manage data for their applications.',
        true),
    Question(
        'You can integrate third-party APIs with Bubble.io by using the API Connector plugin.',
        true),
    Question(
        'In Bubble.io, the visual elements (like buttons, inputs, and text) are all static and cannot change dynamically.',
        false),
    Question(
        'Bubble.io allows users to create custom domains for their applications without needing to purchase an external hosting service.',
        true),
    Question(
        'In Bubble.io, repeating groups are used to display dynamic lists of data, such as a list of users or orders.',
        true),
    Question(
        'A user must know how to code to create complex applications on Bubble.io.',
        false),
    Question(
        'Bubble.io’s "Privacy Rules" allow you to control which users have access to specific data in your app.',
        true),
    Question(
        'Bubble.io does not support responsive design, so applications built on it are fixed in size and do not adapt to different screen resolutions.',
        false),
  ];
  String? getQuestionText(questionNumber) {
    return _questionBank[questionNumber].questionText;
  }

  bool? getQuestionAnswer(questionNumber) {
    return _questionBank[questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (questionNumber + 1 < _questionBank.length) {
      questionNumber++;
    } else {
      questionNumber = 0;
    }
  }

  int numberOfquestion() {
   return  _questionBank.length;
  }
}
