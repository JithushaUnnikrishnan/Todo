import 'package:flutter/material.dart';

import '../todomodel/model.dart';

class Todolist extends StatelessWidget {
  final Todo todo;
  final OnTodochande;
  final Ondelete;

  const Todolist({super.key,required this.todo,required this.OnTodochande,required this.Ondelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      onTap: () {
        // print("clicked");
        OnTodochande(todo);
      },
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      leading: Icon(
       todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
        color: Colors.green,
      ),
      title: Text(
       todo.todotext!,
        style: TextStyle(fontSize: 16, decoration:todo.isDone? TextDecoration.lineThrough : null),
      ),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 9),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.red),
        child: IconButton(
            onPressed: () {
              Ondelete(todo.id);
            },
            icon: Icon(
              Icons.delete,
              size: 18,
              color: Colors.white,
            )),
      ),
    ));
  }
}
