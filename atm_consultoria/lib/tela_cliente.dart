import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({super.key});

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "images/detalhe_cliente.png",
                    width: 120,
                    height: 120,
                  ),
                  Text("Clientes", style: TextStyle(fontSize: 20)),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16),
                child: Image.asset("images/cliente1.png"),
              ),
              Text("Empresa de software"),
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16),
                child: Image.asset("images/cliente2.png"),
              ),
              Text("Empresa de auditoria"),
            ],
          ),
        ),
      ),
    );
  }
}
