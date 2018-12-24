import 'package:flutter/material.dart';
import 'package:udemy_flutter/category_route.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conversor de Unidades',
      home: Container(
        child: CategoryRoute(),
      ),
    );
  }
}
