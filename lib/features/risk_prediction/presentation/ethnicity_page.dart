import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../domain/providers/heart_risk_provider.dart';

class EthnicityPage extends StatelessWidget {
  const EthnicityPage({Key? key}) : super(key: key);

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
            const Text("Оберіть вашу етнічну приналежність:"),
            DropdownButton<String>(
              value: provider.data.ethnicity.isEmpty
                  ? null
                  : provider.data.ethnicity,
              onChanged: (value) => provider.updateEthnicity(value!),
              items: ['Маорі', 'Тихоокеанський острів', 'Азіати', 'Інше']
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Домашня адреса'),
              onChanged: (value) => provider.updateAddress(value),
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
                    Navigator.pushNamed(context, '/lifestyle');
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
