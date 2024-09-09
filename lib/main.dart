import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';




void main() async {


  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Homepage(),
      theme: ThemeData(primarySwatch: Colors.blueGrey )
    );
  }
}