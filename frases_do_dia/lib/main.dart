import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      title: "Frases do Dia",
      home: Container(
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          border: Border.all(width: 5, color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(Icons.home), Icon(Icons.star), Icon(Icons.settings)],
        ),
      ),
    ),
  );
}
