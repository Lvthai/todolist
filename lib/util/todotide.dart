import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class Todotitle extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function (bool?) ? onChanged;
  Function(BuildContext)? deleteFunction;
  Todotitle({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(left: 25.0,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          
          padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(12),
            ),
          child: Row(
            children: [
      
              Checkbox(
                value: taskComplete,
                onChanged: onChanged,
                activeColor: Colors.black,
                ),
      
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskComplete ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ]),
        ),
      ),
      
      );
  }
}