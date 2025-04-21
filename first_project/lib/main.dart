import 'package:flutter/material.dart';

void main() {
  // tudo que esta dentro de main app roda na aplicação
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacityList = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Tarefas'),
          backgroundColor: Colors.amber,
        ),
        body: AnimatedOpacity(
          opacity: opacityList ? 1 : 0,
          duration: Duration(seconds: 1),
          child: ListView(
            children: [
              Task(
                'Aprender Flutter',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3,
              ),
              Task(
                'Ler',
                'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                2,
              ),
              Task(
                'Jogar',
                'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
                1,
              ),
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
      ),
    );
  }
}

//StatelessWidget, estático, não muda
class Task extends StatefulWidget {
  final String title;
  final String imageSrc;
  final int difficulty;

  const Task(this.title, this.imageSrc, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.amber,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black38,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.imageSrc,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.title,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color:
                                  (widget.difficulty >= 1)
                                      ? Colors.white
                                      : Colors.white38,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color:
                                  (widget.difficulty >= 2)
                                      ? Colors.white
                                      : Colors.white38,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color:
                                  (widget.difficulty >= 3)
                                      ? Colors.white
                                      : Colors.white38,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color:
                                  (widget.difficulty >= 4)
                                      ? Colors.white
                                      : Colors.white38,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color:
                                  (widget.difficulty >= 5)
                                      ? Colors.white
                                      : Colors.white38,
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 55,
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                            // print('Nivel: $nivel'); DEBUG
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up, size: 30),
                              Text('UP', style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        value:
                            (widget.difficulty > 0)
                                ? (nivel / widget.difficulty) / 10
                                : 1,
                        color: Colors.white,
                        backgroundColor: Colors.black38,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Nivel: $nivel',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
