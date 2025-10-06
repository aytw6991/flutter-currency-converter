import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  final String title;
  const CurrencyConverterPage({super.key, required this.title});

  @override
  State<CurrencyConverterPage> createState() =>
      _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage extends State<CurrencyConverterPage> {
  double result = 0;
  double exchangeRate = 142.39;
  final TextEditingController textEditingController = TextEditingController();

  void convertCurrency() {
    try {
      String input = textEditingController.text.replaceAll(",", "");
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter the amount in USD',
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  convertCurrency();
                },
                style: TextButton.styleFrom(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
