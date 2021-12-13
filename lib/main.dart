import 'admin.dart';
import 'pengguna.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Page Navigation",
    home: Firstpage(),
  ));
}

class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Selamat Datang")),
        body: Center(
            child: Column(children: <Widget>[
          Text(
            'Welcome To Hread',
            style: TextStyle(fontSize: 28),
          ),
          RaisedButton(
            child: Text('Admin'),
            onPressed: () {Navigator.push(context, MaterialPageRoute(
               builder: (context)=>Admin()
               ));},
          ),
          RaisedButton(
            child: Text('Pengguna'),
            textColor: Colors.red,
            onPressed: () {Navigator.push(context, MaterialPageRoute(
               builder: (context)=>Pengguna()
               ));},
          ),
        ])));
  }
}
