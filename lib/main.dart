import 'package:flutter/material.dart';
import 'package:string_calculator/add.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = TextEditingController();
  String? _result;

  void _calculate() {
    try {
      final sum = add(_controller.text);
      setState(() => _result = 'Sum: $sum');
    } catch (e) {
      setState(() => _result = 'Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TDD String Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter numbers (e.g. 1,2 or 1\\n2 or //;\\n1;2)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _calculate, child: Text('Calculate')),
            const SizedBox(height: 16),
            if (_result != null)
              Text(
                _result!,
                style: TextStyle(
                  fontSize: 18,
                  color: _result!.startsWith('Error')
                      ? Colors.red
                      : Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
