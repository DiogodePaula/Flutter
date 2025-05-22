import 'package:first_project/components/task.dart';
import 'package:first_project/data/task_dao.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidated(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidated(String? value) {
    if (value != null && value.isNotEmpty) {
      if (int.parse(value) < 1 || int.parse(value) > 5) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // keys preservam o estado do formulario
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: SingleChildScrollView(
            // SingleChildScrollView evita que o teclado faca o conteudo se ajustar a altura do teclado
            child: Container(
              height: 600,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidated(value)) {
                          return 'Nome da tarefa não pode ser vazio';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        labelText: 'Nome da Tarefa',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidated(value)) {
                          if (difficultyValidated(value)) {
                            return 'Dificuldade não pode ser vazio e deve ser entre 1 e 5';
                          }
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        labelText: 'Dificuldade',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (String? value) {
                        if (valueValidated(value)) {
                          return 'URL inválida';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        labelText: 'Imagem',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue),
                    ), // BoxDecoration
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        // em caso de url de imagem invalido nao mostra nada
                        errorBuilder: (
                          BuildContext context,
                          Object exception,
                          StackTrace? stackTrace,
                        ) {
                          return Image.asset('assets/images/nophoto.webp');
                        },
                        fit: BoxFit.cover,
                      ), // Image.network
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print(nameController.text);
                        // print(int.parse(difficultyController.text));
                        // print(imageController.text);

                        TaskDao().save(
                          Task(
                            nameController.text,
                            imageController.text,
                            int.parse(difficultyController.text),
                          ),
                        );

                        // pegando o contexto da tela inicial (com widget.taskContext) e adicionando a tarefa
                        // TaskInherited.of(widget.taskContext).newTask(
                        //   nameController.text,
                        //   imageController.text,
                        //   int.parse(difficultyController.text),
                        // );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tarefa criada com sucesso'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pop(
                          context,
                        ); // volta para a tela inicial, sempre utilize pop para voltar
                      }
                    },
                    child: const Text('Criar Tarefa'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
