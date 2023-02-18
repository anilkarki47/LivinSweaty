import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Check your BMI',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: wtController,
                decoration: const InputDecoration(
                  label: Text("Enter your weight in kg"),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: ftController,
                decoration: const InputDecoration(
                  label: Text("Enter your height in Feet"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: inController,
                decoration: const InputDecoration(
                  label: Text("Enter your height in Inch"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;

                      var bmi = iWt / (tM * tM);

                      setState(() {
                        result = 'Your BMI is: $bmi';
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the entry.";
                      });
                    }
                  },
                  child: const Text('Calculate')),
              const SizedBox(
                height: 10,
              ),
              Text(
                result,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
