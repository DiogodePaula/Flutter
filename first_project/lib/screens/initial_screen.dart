import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  // estados que estamos recebendo
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  // estados que estão sendo alterados
  bool opacityList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Tarefas'),
        backgroundColor: Colors.amber,
      ),
      body: AnimatedOpacity(
        opacity: opacityList ? 1 : 0,
        duration: Duration(seconds: 1),
        child: ListView(
          children: const [
            Task('Aprender Flutter', 'assets/images/flutter.png', 3),
            Task('Ler', 'assets/images/book.jpg', 2),
            Task('Jogar', 'assets/images/game.jpg', 1),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacityList = !opacityList;
          });
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
