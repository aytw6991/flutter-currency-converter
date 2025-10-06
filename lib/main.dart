import 'package:currency_converter/currency_converter_material_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        fontFamily: 'WorkSans',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFCFCFC),
          titleTextStyle: TextStyle(
            fontSize: 35,
            color: Color(0xFF161616),
          ),
        ),
      ),
      home: CurrencyConverterMaterialPage(),
    );
  }
}
