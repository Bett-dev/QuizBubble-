import 'package:bubblequiz/quizbrain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBank QuizBaank = QuizBank();

void main() {
  runApp(const QuizAPP());
}

class QuizAPP extends StatefulWidget {
  const QuizAPP({super.key});

  @override
  State<QuizAPP> createState() => _QuizAPPState();
}

List<Icon> answeredQuestion = [];

class _QuizAPPState extends State<QuizAPP> {
  void endOfQuestions() {
    if (QuizBaank.numberOfquestion() == QuizBaank.questionNumber + 1) {
      Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.")
          .show();
     
    } 
  }

  void corretAnswer(bool answer) {
    bool? questionAnswerr =
        QuizBaank.getQuestionAnswer(QuizBaank.questionNumber);
    if (questionAnswerr == answer) {
      answeredQuestion.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      answeredQuestion.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    QuizBaank.getQuestionText(QuizBaank.questionNumber) ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    onPressed: () {
                      corretAnswer(true);
                      endOfQuestions();
                      if (QuizBaank.numberOfquestion()!=QuizBaank.questionNumber+1){
                        setState(() {
                          QuizBaank.nextQuestion();
                        });

                      }
                    
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    child: const Text(
                      'True',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      corretAnswer(false);
                      endOfQuestions();
                         if (QuizBaank.numberOfquestion()!=QuizBaank.questionNumber+1){
                        setState(() {
                          QuizBaank.nextQuestion();
                        });

                      }

                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                    ),
                    child: const Text(
                      'False',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: answeredQuestion,
              )
            ],
          ),
        ),
      ),
    );
  }
}
