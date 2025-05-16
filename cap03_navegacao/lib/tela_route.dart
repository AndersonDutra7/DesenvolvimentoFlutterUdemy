import 'package:flutter/material.dart';

class TelaRoute extends StatefulWidget {
  final String valor;

  const TelaRoute({super.key, required this.valor});

  @override
  _TelaRouteState createState() => _TelaRouteState();
}

class _TelaRouteState extends State<TelaRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Route"), backgroundColor: Colors.green),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              "Essa é a Tela Route! ${widget.valor}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16), //
              ),
              child: Text("Ir para a Home Page"),
            ),
          ],
        ),
      ),
    );
  }
}
