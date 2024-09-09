import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List Todolist = [];

  final _MyBox = Hive.box('mybox');

  void createInitialData (){
    Todolist = [
      ["Make Tutorial",false],
      ["Do Exercise",false],

    ];

  }
  void LoadData(){
    Todolist = _MyBox.get("TODOLIST");
  }



  void UpdateDatabase(){
    _MyBox.put("TODOLIST", Todolist);
  }

}