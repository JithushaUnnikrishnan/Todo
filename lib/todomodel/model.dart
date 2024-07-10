class Todo{
  String? id;
  String? todotext;
  bool isDone;
  Todo({
    required this.id,
    required this.todotext,
    this.isDone= false,
});
  static List<Todo> todoitem(){
    return [
      Todo(id: "01", todotext: "Morning Exercise"),
      // Todo(id: "02", todotext: "Drink 1 litre water"),
    ];

  }
}