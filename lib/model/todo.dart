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
     // ToDo(id: '1', todotext: 'Go to gym',isdone: true),
      
      
    ];
  }
}