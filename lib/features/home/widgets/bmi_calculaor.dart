import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/custom_button.dart';
import 'package:livin_sweaty/constants/global_variables.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _height = 0;
  double _weight = 0;
  double _bmi = 0;
  String _status = "";

  void _calculateBMI() {
    setState(() {
      _height = double.parse(_heightController.text) / 100;
      _weight = double.parse(_weightController.text);
      _bmi = _weight / (_height * _height);
      if (_bmi < 18.5) {
        _status = "Underweight";
      } else if (_bmi >= 18.5 && _bmi < 25) {
        _status = "Normal";
      } else if (_bmi >= 25 && _bmi < 30) {
        _status = "Overweight";
      } else {
        _status = "Obese";
      }
    });
  }

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomButtom(
                  text: "Calculate",
                  onTap: _calculateBMI,
                  color: GlobalVariables.mainBlack,
                  textColor: Colors.white,
                  borderColor: Colors.transparent),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your BMI: ${_bmi.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'You are $_status'.toUpperCase(),
                style: const TextStyle(fontSize: 24.0, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
