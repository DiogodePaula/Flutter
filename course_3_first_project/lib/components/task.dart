import 'package:first_project/components/difficulty.dart';
import 'package:first_project/data/task_dao.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String title;
  final String imageSrc;
  final int difficulty;

  Task(this.title, this.imageSrc, this.difficulty, {super.key});

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.imageSrc.contains('http')) {
      return false;
    }
    return true;
  }

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
                        child:
                            assetOrNetwork()
                                ? Image.asset(
                                  widget.imageSrc,
                                  fit: BoxFit.cover,
                                )
                                : Image.network(
                                  widget.imageSrc,
                                  fit: BoxFit.cover,
                                ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.title,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.difficulty),
                      ],
                    ),
                    SizedBox(
                      width: 55,
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                          onLongPress: () {
                            TaskDao().delete(widget.title);
                          },
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
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
                            children: const [
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
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value:
                            (widget.difficulty > 0)
                                ? (widget.nivel / widget.difficulty) / 10
                                : 1,
                        color: Colors.white,
                        backgroundColor: Colors.black38,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Nivel: ${widget.nivel}',
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
