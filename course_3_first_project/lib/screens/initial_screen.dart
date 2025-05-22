import 'package:first_project/components/task.dart';
import 'package:first_project/data/task_dao.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
        title: Text('Tarefas'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            // snapshot.data é a lista de tarefas
            List<Task> taskList = snapshot.data ?? [];

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('carregando tarefas...'),
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('carregando tarefas...'),
                    ],
                  ),
                );
              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('carregando tarefas...'),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  if (taskList.isNotEmpty) {
                    return ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (BuildContext context, index) {
                        final Task task = taskList[index];

                        return task;
                      },
                    );
                  }

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info_outline, size: 80, color: Colors.amber),
                        Text('Nenhuma tarefa encontrada'),
                      ],
                    ),
                  );
                }

                return Center(child: Text('Erro ao carregar tarefas'));
            }
            return Center(child: Text('Erro desconhecido'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          ).then(
            (value) => setState(() {
              print('recarregando tela inicial');
            }),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
    );
  }
}
