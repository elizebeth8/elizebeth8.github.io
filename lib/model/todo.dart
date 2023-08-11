class ToDo{
  String? id;
  String? todotext;
   bool isdone;

  ToDo({
    required this.id,
    required this.todotext,
    this.isdone=false
  });

  static List<ToDo> todolist(){
    return[
      ToDo(id: '1', todotext: 'Go to gym',isdone: true),
      ToDo(id: '2', todotext: 'Go to gymikki',isdone: true),
      ToDo(id: '3', todotext: 'Go to gymbro',),
      ToDo(id: '4', todotext: 'Go to gym',isdone: true),
      
    ];
  }
}