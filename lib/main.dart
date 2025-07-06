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

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int numberOfDices = 3;
  late List<int> dices;

  @override
  void initState() {
    super.initState();
    _rollAll();
  }

  void _rollAll() {
    setState(() {
      dices = List.generate(numberOfDices, (_) => Random().nextInt(6) + 1);
    });
  }

  void _selectNumberOfDices(int newNumber) {
    setState(() {
      numberOfDices = newNumber;
      _rollAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<int>(
          dropdownColor: Colors.red[300],
          value: numberOfDices,
          items: const [1, 2, 3, 4, 5, 6].map((count) {
            return  DropdownMenuItem<int>(
              value: count,
              child: Text('$count dice', style: TextStyle(
                color: Colors.white60,
                fontSize: 18
              ),),
            );
          }).toList(),
          onChanged: (int? value) {
            if (value != null) {
              _selectNumberOfDices(value);
            }
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            numberOfDices,
            (index) => DiceImage(number: dices[index], onPressed: _rollAll),
          ),
        ),
      ],
    );
  }
}

class DiceImage extends StatelessWidget {
  final int number;
  final VoidCallback onPressed;

  const DiceImage({super.key, required this.number, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            overlayColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: Image(image: AssetImage('images/dice$number.png')),
        ),
      ),
    );
  }
}
