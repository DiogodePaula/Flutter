import 'package:first_project/screens/initial_screen.dart';
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
      home: const InitialScreen(),
    );
  }
}
