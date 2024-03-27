import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const Sub7a());
}

class Sub7a extends StatelessWidget {
  const Sub7a({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
