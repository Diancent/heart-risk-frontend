import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../domain/providers/heart_risk_provider.dart';

class AgeGenderPage extends StatelessWidget {
  const AgeGenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HeartRiskProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: provider.data.gender.isEmpty ? null : provider.data.gender,
              onChanged: (value) => provider.updateGender(value!),
              items: ['Чоловік', 'Жінка']
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Вік'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  provider.updateAge(int.tryParse(value) ?? 0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ethnicityAddress');
              },
              child: const Text("Далі"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Повернення на попередній етап
              },
              child: Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
