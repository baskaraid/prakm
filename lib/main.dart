import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //judul
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Content',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}