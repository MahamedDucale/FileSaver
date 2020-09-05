import 'dart:io';
import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FileSaver',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 TextEditingController mycontroller = new TextEditingController();
 Map<String,Object> mymap = {
   "id": 1,
   "name": "Mahamed",
   "height":1.76
 };
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("FileSaver"),centerTitle: true),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new TextFormField(controller: mycontroller),
            new RaisedButton(onPressed: saveText
            ,child: 
            new Text("Save text to file")
            ),
            new RaisedButton(onPressed: returnText
            ,child: 
            new Text("Retrieve text from file")
            )
           
          ]
        )
      )
    );
  }
  void saveText() async{
    String path = await getPath();
    File savedFile = new File(path + '/text.txt');
    savedFile.writeAsString(jsonEncode(mymap));
  }
  void returnText() async{
    String path = await getPath();
    File savedFile = new File(path + '/text.txt');
    String text = await savedFile.readAsString();
    Map<String,Object> jsontext = jsonDecode(text);
    Map<String,Object> adder = {"gender":mycontroller.text};
    jsontext.addAll(adder);
    print(jsontext);
  }
  Future<String> getPath()async{
    Directory mydir = await getApplicationDocumentsDirectory();
    return mydir.path;
  }
}

