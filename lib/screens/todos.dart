import 'package:flutter/material.dart';
import 'package:todos/constants/colors.dart';
import 'package:todos/model/todo.dart';

class Todos extends StatelessWidget {
  final ToDo todo;
  final onTodoChanged;
  final onDeletItem;

  const Todos({
    super.key,
    required this.todo,
    required this.onTodoChanged,
    required this.onDeletItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          onTodoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.TodoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(6),
          ),
          child: IconButton(
            color: Colors.white,
            icon: Icon(
              Icons.delete,
            ),
            iconSize: 18,
            onPressed: () {
              onDeletItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
