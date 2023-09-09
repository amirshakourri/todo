import 'package:flutter/material.dart';
import 'package:todos/constants/colors.dart';
import 'package:todos/screens/todos.dart';

import '../model/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEEEFF5),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Stack(
            children: [
              ListView(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        'Todos List',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  for (ToDo todox in todoList)
                    Todos(
                      todo: todox,
                      onTodoChanged: _handleToDoChange,
                      onDeletItem: _DeletItemChange,
                    ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                            )
                          ],
                        ),
                        child: TextField(
                          controller: _todoController,
                          decoration: InputDecoration(
                            hintText: "Add a new todo",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _addToDoItem(_todoController.text);
                        },
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 40),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tdBlue,
                          minimumSize: Size(60, 60),
                          elevation: 10,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _DeletItemChange(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      if (toDo == '') {
        return;
      } else {
        todoList.add(
          ToDo(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            TodoText: toDo,
          ),
        );
      }
    });
    _todoController.clear();
  }
}
