// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todolist/task.dart';
import 'package:todolist/taskData.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class todolist extends StatefulWidget {
  @override
  State<todolist> createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  String c = "";
  taskData tmix = taskData.getel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: ((context) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "add task",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              onChanged: (value) => {c = value},
                              autofocus: true,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              child: MaterialButton(
                                color: Colors.lightBlueAccent,
                                onPressed: () {
                                  setState(() {
                                    tmix.t.add(task(name: c));
                                    Navigator.pop(context);
                                    print(tmix.t);
                                  });
                                },
                                child: const Text(
                                  "add",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 29,
                            ),
                          ],
                        ),
                      )));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      size: 30,
                      color: Colors.lightBlueAccent,
                      Icons.list,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "to do list",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${tmix.t.length} tasks",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    tmix.t.isEmpty ? "" : "double tap on task to edit",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: listV()),
            ),
          ],
        ),
      ),
    );
  }

  Widget listV() {
    return ListView.builder(
      itemCount: tmix.t.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onDoubleTap: () {
            print(tmix.t[index]);
            AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                body: Column(
                  children: [
                    const Text(
                      "edit",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      autofocus: true,
                      onChanged: (c) {
                        setState(() {
                        tmix.t[index].name = c;     
                        });

                      },
                    )
                  ],
                )).show();
          },
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${tmix.t[index].name}",
                    style: TextStyle(
                        decoration: tmix.t[index].done
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          print(tmix.t[index].name);
                          tmix.t.removeAt(index);
                        });
                      }),
                  Checkbox(
                      value: tmix.t[index].done,
                      onChanged: (dynamic v) {
                        setState(() {
                          tmix.t[index].done = v;
                        });
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  /* Widget listss(task t1, int i) {
    return textAndCheck(t: t1, index: i);
  }*/
}
/*
class checkkbox extends StatefulWidget {
  task t;
  int i;
  checkkbox({required this.i, required this.t});

  @override
  State<checkkbox> createState() => _checkkboxState();
}

class _checkkboxState extends State<checkkbox> {
  void chechChsange(v) {
    setState(() {
      widget.t.done = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: widget.t.done, onChanged: chechChsange);
  }
}

// ignore: must_be_immutable
class textAndCheck extends StatefulWidget {
  task t;
  int index;
  textAndCheck({required this.t, required this.index});

  @override
  State<textAndCheck> createState() => _textAndCheckState();
}

class _textAndCheckState extends State<textAndCheck> {
  bool isCheck = false;
  taskData tt = taskData.getel();
  void chechChsange(v) {
    setState(() {
      widget.t.done = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.t.name}",
              style: TextStyle(
                  decoration:
                      widget.t.done ? TextDecoration.lineThrough : null),
            ),
            Expanded(child: SizedBox()),
            IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    print(tt.t[widget.index].name);
                    tt.t.add(task(name: "dddddddddd"));
                    print(tt.t);
                  });
                }),
            Checkbox(value: widget.t.done, onChanged: chechChsange)
          ],
        ),
      ),
    );
  }
}*/
