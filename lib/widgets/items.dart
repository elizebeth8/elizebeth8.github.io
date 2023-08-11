import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/model/todo.dart';

class item extends StatelessWidget {
  const item({super.key, required this.toDo, this.ontodochanged, this.ondeleteitem});

  final ToDo toDo;
  final ontodochanged;
  final ondeleteitem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          ontodochanged(toDo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        tileColor: kblue,
        leading: Icon(toDo.isdone?Icons.check_box:Icons.crop_square_outlined,color: kpink,),
        title: Text(toDo.todotext.toString(),
        style:  TextStyle(
          fontSize: 20,
          color: kpink,
          decoration:toDo.isdone? TextDecoration.lineThrough:null),),
        trailing: Container(
          height: 40,
          width: 45,
          decoration: BoxDecoration(
            color: kcream,
            borderRadius: BorderRadius.circular(40)
          ),
          child: IconButton(
            color: kpink,
            iconSize: 18,
            icon:Icon(Icons.delete,size: 25,) ,
            onPressed: () {
              ondeleteitem(toDo.id);
            },
          ),
        ),
      ),
    );
  }
}