import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> questions = [
    "¿He dormido 8 horas?",
    "¿La Tierra es plana?",
    "¿Taiwan es un país?",
    "¿El hombre fue a la Luna?",
    "¿He almorzado hoy?",
  ];


  List<Widget> scoreKeeper = [
    Icon(
      Icons.check,
      color: Color(0xff06d6a0),
      size: 30.0,
    ),
  ];

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
                  questions[0],
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
                  onPressed: (){
                    scoreKeeper.add(
                      const Icon(
                        Icons.close,
                        color: Colors.white,
                      )
                    );

                    setState(() { });
                  },
                  color: const Color(0xff06d6a0),
                  child: const Text(
                      "Verdadero"
                  )
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  onPressed: (){},
                  color: const Color(0xffef476f),
                  child: const Text(
                      "Falso"
                  )
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}