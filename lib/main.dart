import 'package:flutter/material.dart';
import 'package:i3rbly/views/home_page.dart';

void main() {
  runApp(const I3rbly());
}


class I3rbly extends StatelessWidget {
  const I3rbly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
