import 'package:atm_consultoria/tela_cliente.dart';
import 'package:atm_consultoria/tela_contato.dart';
import 'package:atm_consultoria/tela_empresa.dart';
import 'package:atm_consultoria/tela_servico.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _acessarMenuEmpresa() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaEmpresa()),
    );
  }

  void _acessarMenuServico() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaServico()),
    );
  }

  void _acessarMenuCliente() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaCliente()),
    );
  }

  void _acessarMenuContato() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaContato()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("ATM Consultoria"),
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _acessarMenuEmpresa,
                  child: Image.asset(
                    "images/menu_empresa.png",
                    width: 120,
                    height: 120,
                  ),
                ),
                GestureDetector(
                  onTap: _acessarMenuServico,
                  child: Image.asset(
                    "images/menu_servico.png",
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _acessarMenuCliente,
                  child: Image.asset(
                    "images/menu_cliente.png",
                    width: 120,
                    height: 120,
                  ),
                ),
                GestureDetector(
                  onTap: _acessarMenuContato,
                  child: Image.asset(
                    "images/menu_contato.png",
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
