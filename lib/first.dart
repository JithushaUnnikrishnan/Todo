import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/todomodel/model.dart';
import 'package:todo/widgets/todolist.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final todoitem = Todo.todoitem();
  final todocontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                // searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All ToDos",
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (Todo todoo in todoitem.reversed)
                        Todolist(
                          todo: todoo, OnTodochande: handleToDoChange, Ondelete:deleteitem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2, blurRadius: 3, color: Colors.grey)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                     controller: todocontroller,
                      decoration: InputDecoration(
                          hintText: "Add New Todo", border: InputBorder.none),
                    ),
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(bottom: 10, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        todoadd(todocontroller.text);
                      },
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 40),
                      ),
                      style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),backgroundColor: Colors.blue,foregroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
  void todoadd(String ToDo){
   setState(() {
     todoitem.add(Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), todotext: ToDo));
   });
   todocontroller.clear();
  }
  void handleToDoChange(Todo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });

  }
  void deleteitem(String ID){
    setState(() {
      todoitem.removeWhere((item)=>item.id==ID);
    });
  }

  // Widget searchBox() {
  //   return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 15),
  //       height: 50,
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20), color: Colors.white),
  //       child: TextField(
  //         decoration: InputDecoration(
  //             hintText: "Search",
  //             contentPadding: EdgeInsets.all(0),
  //             prefixIcon: Icon(Icons.search),
  //             prefixIconConstraints:
  //                 BoxConstraints(maxHeight: 20, minWidth: 40),
  //             border: InputBorder.none),
  //       ));
  // }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey.shade300,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/todo.jpeg",
              ),
            ),
          )
        ],
      ),
    );
  }
}
