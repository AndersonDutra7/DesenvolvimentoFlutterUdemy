import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      title: "Frases do Dia",
      // home: Container(color: Colors.amber)
      home: Column(
        children: <Widget>[Text("Texto 1"), Text("Texto 2"), Text("Texto 3")],
      ),
    ),
  );
}
