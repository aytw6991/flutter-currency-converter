import 'package:currency_converter/currency_converter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        colorSchemeSeed: Colors.lime,
        fontFamily: 'WorkSans',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Color(0xFFF0F4C3),
            fontFamily: 'WorkSans',
            fontSize: 33,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFAFB42B)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFDCE775)),
          ),
        ),
      ),
      home: CurrencyConverterPage(title: 'Currency Converter'),
    );
  }
}
