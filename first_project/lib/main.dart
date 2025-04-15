import 'package:flutter/material.dart';

void main() {
  // tudo que esta dentro de main app roda na aplicação
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(color: Colors.red, width: 100, height: 100),
                Container(color: Colors.blue, width: 50, height: 50),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(color: Colors.blue, width: 100, height: 100),
                Container(color: Colors.red, width: 50, height: 50),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(color: Colors.green, width: 100, height: 100),
                Container(color: Colors.yellow, width: 100, height: 100),
                Container(color: Colors.purple, width: 100, height: 100),
              ],
            ),
            Container(
              color: Colors.amber,
              width: 300,
              height: 50,
              child: const Text(
                'Hello world!',
                style: TextStyle(fontSize: 25, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Botão clicado');
              },
              child: Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}
