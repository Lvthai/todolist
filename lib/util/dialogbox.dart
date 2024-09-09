import 'package:flutter/material.dart';
import 'package:flutter_application_2/util/mybutton.dart';


class DialogBox extends StatelessWidget {
  
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key,
   required this.controller,
   required this.onSave,
   required this.onCancel,
   });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          
          TextField(
            controller: controller,
            
            decoration: InputDecoration(
              
              border: OutlineInputBorder(),
              hintText: " Add a new task",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save
              MyButton(text: 'save', onPressed: onSave),

              const SizedBox(width: 8,),
              
              MyButton(text: 'cancel', onPressed: onCancel),
            ],
          ),
        ],
    
        ),
        ),
    );
  }
}