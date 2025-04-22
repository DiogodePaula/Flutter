import 'package:first_project/components/difficulty.dart';
import 'package:flutter/material.dart';

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
                        child: Image.asset(widget.imageSrc, fit: BoxFit.cover),
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
