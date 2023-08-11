import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/widgets/items.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist=ToDo.todolist();
  final todocontroller=TextEditingController();
  List<ToDo>foundtodo=[];

  @override
  void initState() {
    foundtodo=todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      appBar: _buildappbar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child:SingleChildScrollView(
              child: Column(children: [
                searchbox(),
                ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50,bottom: 20),
                      child: Text('My Todo list',style: TextStyle(color: kcream,fontSize: 25,fontWeight: FontWeight.w600,),),
                    ),
                    for(ToDo toDo in foundtodo.reversed)
                     item(toDo:toDo,
                     ontodochanged: handletodochange,
                     ondeleteitem: deletetodoitem,
                     ),
                    
                  ],
                ),
                SizedBox(height: 50,)
              ],),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kcream,
                  boxShadow: [BoxShadow(offset: Offset(0.0, 0.0),color: Colors.black26,blurRadius: 10.0,),],
                  borderRadius: BorderRadius.circular(10),
                  
                ),
                child: TextField(
                  controller: todocontroller,
                  decoration: InputDecoration(
                    hintText: 'Add new item to todo list',
                    border: InputBorder.none,
                  ),
                ),
              )),
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(onPressed:() {
                  addtodoitem(todocontroller.text);
                }, 
                child: Text('+',style: TextStyle(color: kbg,fontSize: 40),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kblue,
                  minimumSize: Size(60, 60),
                  elevation: 10,
                ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }


  void handletodochange(ToDo toDo){
    setState(() {
      toDo.isdone=!toDo.isdone;
    });
    
  }

  void deletetodoitem(String id){
    setState(() {
      todoslist.removeWhere((element) => element.id==id);
    });
    
  }

  void addtodoitem(String toDo){
    setState(() {
       todoslist.add(ToDo(id:DateTime.now().millisecondsSinceEpoch.toString() ,todotext: toDo));
    });
    todocontroller.clear();
    
  }

  void runfilter(String enteredkeyword){
    List<ToDo> results=[];
    if(enteredkeyword.isEmpty){
      results=todoslist;
    }
    else{
      results=todoslist.where((item) => item.todotext!.toLowerCase().contains(enteredkeyword.toString())).toList();
    }
    setState(() {
      foundtodo=results;
    });
  }

  Widget searchbox(){
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
      
            decoration: BoxDecoration(
              color: kcream,
              borderRadius: BorderRadius.circular(20)
            ),
            child: TextField(
              onChanged: (value) => runfilter(value),
              decoration: InputDecoration(
                contentPadding:EdgeInsets.all(10),
                prefixIcon: Icon(Icons.search,color: kbg,size: 25,),
                prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
                border: InputBorder.none,
                hintText: 'Search'
              ),
            ),
          );
 }

  AppBar _buildappbar() {
    return AppBar(
      backgroundColor:kblue,
      title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Icon(Icons.menu,color: kbg,size: 30,),
        Container(
          child: ClipRRect(
            child: Image.asset('assets/images/me.jpg',height: 50,width: 50,)),
        )
      ],)
      );
  }
}