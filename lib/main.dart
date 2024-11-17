
import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const QuizAPP());
}


class QuizAPP extends StatefulWidget {
  const QuizAPP({super.key});

  @override
  State<QuizAPP> createState() => _QuizAPPState();
}
 List <Icon> answeredQuestion=[];


class _QuizAPPState extends State<QuizAPP> {
  List <Question> questionBank=[
Question(q: 'Bubble.io is a no-code platform that allows users to build fully functional web applications without writing any code.', a: true),
Question(q: 'In Bubble.io, workflows can only be triggered by user interactions such as button clicks or page loads.', a: false),
Question(q: 'Bubble.io provides a built-in database where users can store and manage data for their applications.', a: true),
Question(q: 'You can integrate third-party APIs with Bubble.io by using the API Connector plugin.', a: true),
Question(q: 'In Bubble.io, the visual elements (like buttons, inputs, and text) are all static and cannot change dynamically.', a: false),
Question(q: 'Bubble.io allows users to create custom domains for their applications without needing to purchase an external hosting service.', a: true),
Question(q: 'In Bubble.io, repeating groups are used to display dynamic lists of data, such as a list of users or orders.', a: true),
Question(q: 'A user must know how to code to create complex applications on Bubble.io.', a: false),
Question(q: 'Bubble.io’s "Privacy Rules" allow you to control which users have access to specific data in your app.', a: true),
Question(q: 'Bubble.io does not support responsive design, so applications built on it are fixed in size and do not adapt to different screen resolutions.', a: false),

  ];
   
   int questionNumber=0;

   void nextQuestion (){
     if (questionBank[questionNumber].questionAnswer==true){
                        answeredQuestion.add(const Icon(Icons.check,color: Colors.green,),);
                      } else {
                         answeredQuestion.add(const Icon(Icons.close,color: Colors.green,),);
                      }
                     if (questionBank.length==questionNumber+1){questionNumber=0;
                     answeredQuestion.clear();
                     } else{
                      questionNumber++;
                     }
                   
   }
    void nextQuestionS (){
     if (questionBank[questionNumber].questionAnswer==false){
                        answeredQuestion.add(const Icon(Icons.check,color: Colors.green,),);
                      } else {
                         answeredQuestion.add(const Icon(Icons.close,color: Colors.green,),);
                      }
                     if (questionBank.length==questionNumber+1){questionNumber=0;
                     answeredQuestion.clear();
                     } else{
                      questionNumber++;
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

               Expanded(child: Center(child: Text(questionBank[questionNumber].questionText??'',style: const TextStyle(color: Colors.white),),),),
              Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                     nextQuestion();
                    });

                  },style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green),), 
                  child: const Text('True',style: TextStyle(color: Colors.white),),),
                  TextButton(onPressed: (){
                    setState(() {
                      nextQuestionS();
                    });

                  },style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red),), 
                  child: const Text('False',style: TextStyle(color: Colors.white),),),
                ],
              ),
              Row(children:answeredQuestion,
              )
            ],
          ),
        ),
      ),
    );
  }
}
