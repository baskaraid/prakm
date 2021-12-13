import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() => runApp(Admin());

class Admin extends StatelessWidget {
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
