import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // ✅ Added key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(), // ✅ Added const
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key); // ✅ Added key

  @override
  CalculatorScreenState createState() => CalculatorScreenState(); // ✅ Renamed class to public
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _input = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "=") {
        try {
          _output = _evaluateExpression(_input);
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "C") {
        _output = "0";
        _input = "";
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  String _evaluateExpression(String expression) {
    // Basic evaluator for expressions like "1+2", "3*3", etc.
    return expression; // Simple mock evaluator for demo purposes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(_output, style: const TextStyle(fontSize: 48)),
          Row(
            children: <Widget>[
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("/"),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("*"),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton("C"),
              _buildButton("0"),
              _buildButton("="),
              _buildButton("+"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(buttonText, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
