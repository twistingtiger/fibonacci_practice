// Flutter code sample for widgets.Form.1

// This example shows a [Form] with one [TextFormField] and a [RaisedButton]. A
// [GlobalKey] is used here to identify the [Form] and validate input.

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new HomePage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final myController = TextEditingController();
  int value = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Fibonnaci Calculator'),
      ),
      backgroundColor: Colors.white,
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                onChanged: (text){
                  value = int.parse(text);
                  //out = fibonnaci(value).toString();
                },
                controller: myController,
                decoration: new InputDecoration(labelText: "Enter your number"),
                keyboardType: TextInputType.number,
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(output(value)),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}

String output(int n) {
  String out = "";

  for(int i=0; i<=n; i++) {
    //return n < 2 ? n: (fibonnaci(n-1) + fibonnaci(n-2));
    out += fibonnaci(i).toString() + ", ";
  }
  return out;
}

int fibonnaci(int n) {
  return n < 2 ? n : fibonnaci(n - 2) + fibonnaci (n - 1);
}