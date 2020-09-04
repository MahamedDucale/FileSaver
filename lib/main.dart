import 'dart:io';
import 'dart:ui';

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
    savedFile.writeAsString(mycontroller.text);
  }
  void returnText() async{
    String path = await getPath();
    File savedFile = new File(path + '/text.txt');
    String text = await savedFile.readAsString();
    print(text);
  }
  Future<String> getPath()async{
    String mydir = getApplicationDocumentsDirectory().toString();
    return mydir;
  }
}

