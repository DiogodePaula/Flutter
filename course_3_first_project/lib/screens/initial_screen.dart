import 'package:first_project/data/task_inherited.dart';
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
        padding: EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
    );
  }
}
