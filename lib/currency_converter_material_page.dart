import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  
  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage 
    extends State<CurrencyConverterMaterialPage> {
  
  double result = 0;
  double exchangeRate = 142.39;
  final Color white = Color(0xFFFCFCFC);
  final TextEditingController textEditingController = TextEditingController();

  void convertCurrency() {
    try {
      String input = textEditingController.text.replaceAll(",", "");
      print(input);
      setState(() {
      result = double.parse(input) * exchangeRate;
    });
    } catch (e) {
      print('Please enter a valid number!');
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(5)
      );

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        title: const Text('Currency Converter'),
        titleTextStyle: TextStyle(
          color: Color(0xFF161616),
          fontSize: 30,
          fontFamily: 'WorkSans',
          fontWeight: FontWeight.w900
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NPR ${result != 0 ? result.toStringAsFixed(2) : 0}',
                style: const TextStyle(
                  color: Color(0xFF161616),
                  fontSize: 55,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true
                ),
                style: TextStyle(
                  color: Colors.black
                ),
                decoration: InputDecoration(
                  hintText: 'Enter the amount in USD',
                  hintStyle: TextStyle(
                    color: Colors.black
                  ),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border
                )
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  convertCurrency();
                },
                style: TextButton.styleFrom(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}