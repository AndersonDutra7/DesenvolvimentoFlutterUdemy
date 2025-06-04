import 'package:daily_notes/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DailyNotes());
}

class DailyNotes extends StatelessWidget {
  const DailyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
