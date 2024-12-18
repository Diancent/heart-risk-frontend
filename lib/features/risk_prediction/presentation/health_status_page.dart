import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../domain/providers/heart_risk_provider.dart';

class HealthStatusPage extends StatefulWidget {
  const HealthStatusPage({Key? key}) : super(key: key);

  @override
  _HealthStatusPageState createState() => _HealthStatusPageState();
}

class _HealthStatusPageState extends State<HealthStatusPage> {
  String? selectedPressure;

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
            const Text("Ви курите?"),
            Switch(
              value: provider.data.smokes,
              onChanged: (value) => provider.updateSmokingStatus(value),
            ),
            const SizedBox(height: 20),
            const Text("Чи знаєте ви свій артеріальний тиск?"),
            DropdownButton<String>(
              value: selectedPressure,
              onChanged: (value) {
                setState(() {
                  selectedPressure = value;
                  if (value == "Так") {
                    provider.updateBloodPressure('');
                  } else {
                    provider.updateBloodPressure(null);
                  }
                });
              },
              items: ["Так", "Ні"]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            if (selectedPressure == "Так")
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Артеріальний тиск'),
                keyboardType: TextInputType.number,
                onChanged: (value) => provider.updateBloodPressure(value),
              ),
            const SizedBox(height: 20),
            const Text("У вас підвищений рівень холестерину?"),
            Switch(
              value: provider.data.highCholesterol,
              onChanged: (value) => provider.updateHighCholesterol(value),
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
                    Navigator.pushNamed(context, '/healthStatus');
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
