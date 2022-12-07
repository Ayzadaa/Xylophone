import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Xylophone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();

  Widget buildKey({
    required Color color,
    required int soundNumber,
    required double width,
    required String letter,
  }) {
    return InkWell(
      onTap: () {
        player.play(AssetSource('note$soundNumber.wav'));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        height: 80,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              width: 20,
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                letter,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildKey(
                    color: Colors.red, soundNumber: 1, width: 450, letter: 'G'),
                buildKey(
                    color: Colors.orange,
                    soundNumber: 2,
                    width: 400,
                    letter: 'F'),
                buildKey(
                    color: Colors.yellow,
                    soundNumber: 3,
                    width: 350,
                    letter: 'E'),
                buildKey(
                    color: Colors.green,
                    soundNumber: 4,
                    width: 300,
                    letter: 'D'),
                buildKey(
                    color: Colors.cyan,
                    soundNumber: 5,
                    width: 250,
                    letter: 'C'),
                buildKey(
                    color: Colors.blue,
                    soundNumber: 6,
                    width: 200,
                    letter: 'B'),
                buildKey(
                    color: Colors.purple,
                    soundNumber: 7,
                    width: 150,
                    letter: 'A'),
              ]),
        ),
      ),
    );
  }
}
