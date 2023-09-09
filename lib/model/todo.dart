class ToDo {
  String? id;
  String? TodoText;
  bool isDone;

  ToDo({
    this.id,
    this.TodoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', TodoText: "Hello world", isDone: true),
      ToDo(id: '02', TodoText: "amir", isDone: true),
      ToDo(id: '03', TodoText: "rez"),
      ToDo(id: '04', TodoText: "sahar"),
      ToDo(id: '05', TodoText: "rohani"),
      ToDo(id: '06', TodoText: "ali"),
      ToDo(id: '07', TodoText: "vali"),
    ];
  }
}
