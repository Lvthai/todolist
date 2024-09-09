import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/database.dart';
import 'package:flutter_application_2/util/dialogbox.dart';
import 'package:flutter_application_2/util/todotide.dart';
import 'package:hive_flutter/hive_flutter.dart';


class Homepage extends StatefulWidget {
  
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
  
}

class _HomepageState extends State<Homepage> {

  final _MyBox = Hive.box('mybox');

  final _controller = TextEditingController();
  
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if(_MyBox.get("TODOLIST") == null ){
      db.createInitialData();
    } else{
      db.LoadData();
    }
    super.initState();
  }

 
  void CheckboxChanged(bool? value,int index){
    setState(() {
      db.Todolist[index][1] =! db.Todolist[index][1];
    });
    db.UpdateDatabase();
  }


  void saveNewTask(){
    setState(() {
      db.Todolist.add([ _controller.text,false ]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.UpdateDatabase();
  }



  void createNewTask(){
    showDialog(context: context, builder: (context) {
      
      return DialogBox(
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
        controller: _controller,
      );
    },);
  }

  void deleteTask(int index){
    setState(() {
      db.Todolist.removeAt(index);
    });
    db.UpdateDatabase();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        
        title: Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.Todolist.length,
        itemBuilder: (context, index) {
          return Todotitle(
            taskName: db.Todolist[index][0],
            taskComplete: db.Todolist[index][1],
            onChanged: (value) => CheckboxChanged(value,index),
            deleteFunction: (context) => deleteTask(index),

          );
        },
        

      ),
    );
  }
}