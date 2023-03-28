import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/meal/services/meal_services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/water.dart';

class WaterIntakePage extends StatefulWidget {
  const WaterIntakePage({Key? key}) : super(key: key);

  @override
  WaterIntakePageState createState() => WaterIntakePageState();
}

class WaterIntakePageState extends State<WaterIntakePage> {
  List<WaterIntakeData>? waterIntakeData;

  AllMealServices mealServices = AllMealServices();

  @override
  void initState() {
    super.initState();
    fetchWaterIntakeData();
  }

  fetchWaterIntakeData() async {
    waterIntakeData = await mealServices.fetchWaterIntakeData(context);
    setState(() {});
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Water Intake'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            primaryYAxis: NumericAxis(
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              maximum: 12,
            ),
            series: <ChartSeries>[
              ColumnSeries<WaterIntakeData, String>(
                dataSource: waterIntakeData!,
                xValueMapper: (WaterIntakeData intake, _) =>
                    DateFormat.MMMd().format(DateTime.parse(intake.date)),
                yValueMapper: (WaterIntakeData intake, _) => intake.waterIntake,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelAlignment: ChartDataLabelAlignment.middle,
                  textStyle:
                      TextStyle(color: GlobalVariables.offWhite, fontSize: 20),
                ),
                animationDuration: 1000,
                enableTooltip: true,
                color: GlobalVariables.mainBlack,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
