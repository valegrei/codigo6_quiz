import 'package:codigo6_quiz/pages/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff073b4c),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  onPressed: () {
                    quizBrain.verifyAnswer(context, true);
                    setState(() {});
                  },
                  color: const Color(0xff06d6a0),
                  child: const Text("Verdadero")),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  onPressed: () {
                    if (quizBrain.isFinished()) {
                      Alert(
                          context: context,
                          type: AlertType.success,
                          title: "El quiz finalizó!",
                          desc: "Quieres iniciar nuevamente",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Reiniciar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                quizBrain.restart();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              width: 120,
                            )
                          ]).show();
                    } else {
                      quizBrain.verifyAnswer(context, false);
                    }
                    setState(() {});
                  },
                  color: const Color(0xffef476f),
                  child: const Text("Falso")),
            ),
          ),
          Row(
            children: quizBrain.scoreKeeper,
          )
        ],
      ),
    );
  }
}
