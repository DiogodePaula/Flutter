import 'package:first_project/components/task.dart';
import 'package:first_project/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  // estados que estamos recebendo
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Tarefas'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: const [
          Task('Aprender Flutter', 'assets/images/flutter.png', 3),
          Task('Ler', 'assets/images/book.jpg', 2),
          Task('Jogar', 'assets/images/game.jpg', 1),
          SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
    );
  }
}
