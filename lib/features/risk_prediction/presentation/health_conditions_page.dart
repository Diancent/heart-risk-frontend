import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../domain/providers/heart_risk_provider.dart';

class HealthConditionsPage extends StatefulWidget {
  const HealthConditionsPage({Key? key}) : super(key: key);

  @override
  _HealthConditionsPageState createState() => _HealthConditionsPageState();
}

class _HealthConditionsPageState extends State<HealthConditionsPage> {
  final List<String> conditions = [
    "У мене діабет",
    "У мене миготлива аритмія",
    "Інше",
    "Нічого з перерахованого"
  ];
  final List<String> selectedConditions = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HeartRiskProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Оберіть, що стосується вас:"),
            Expanded(
              child: ListView.builder(
                itemCount: conditions.length,
                itemBuilder: (context, index) {
                  final condition = conditions[index];
                  return CheckboxListTile(
                    title: Text(condition),
                    value: selectedConditions.contains(condition),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedConditions.add(condition);
                        } else {
                          selectedConditions.remove(condition);
                        }
                        provider.updateHealthConditions(selectedConditions);
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Назад
                  },
                  child: const Text("Назад"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/result');
                  },
                  child: const Text("Далі"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
