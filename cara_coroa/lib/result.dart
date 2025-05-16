import 'dart:math';

import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String valor;

  const Result(this.valor, {super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  late String caminhoImagem;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    caminhoImagem =
        widget.valor == "coroa"
            ? "assets/images/moeda_coroa.png"
            : "assets/images/moeda_cara.png";

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff61bd86),
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(angle: _animation.value, child: child);
              },
              child: Image.asset(caminhoImagem),
            ),

            SizedBox(height: 32),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xff61bd86),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'AncizarSerif',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.arrow_back, size: 30),

                    SizedBox(width: 8),
                    Text("VOLTAR"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
