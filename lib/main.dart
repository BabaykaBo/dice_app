import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.red,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [DiceImage(), DiceImage()],
      ),
    );
  }
}

class DiceImage extends StatefulWidget {
  const DiceImage({super.key});

  @override
  State<DiceImage> createState() => _DiceImageState();
}

class _DiceImageState extends State<DiceImage> {
  @override
  Widget build(BuildContext context) {
    int number = _getNumber();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            overlayColor: Colors.transparent,
          ),
          onPressed: () {
            setState(() {
              number = _getNumber();
            });
          },
          child: Image(image: AssetImage('images/dice$number.png')),
        ),
      ),
    );
  }

  int _getNumber() {
    return Random().nextInt(6) + 1;
  }
}
