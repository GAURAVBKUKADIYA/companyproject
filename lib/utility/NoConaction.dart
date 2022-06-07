import 'package:flutter/material.dart';

class NoConaction extends StatefulWidget {


  @override
  State<NoConaction> createState() => _NoConactionState();
}

class _NoConactionState extends State<NoConaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(child: Text("Noconaction"),),
      ),
    );
  }
}
