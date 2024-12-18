import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../domain/providers/heart_risk_provider.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HeartRiskProvider>(context, listen: false);

    // Наприклад, "вік серця" обчислюється тут
    int heartAge = provider.data.age + 5; // Спрощена логіка

    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text("Ваш вік серця: $heartAge років", style: Theme.of(context).textTheme.headline5),
            Text(
              "Ваш вік серця: $heartAge років",
            ),
            const SizedBox(height: 20),
            const Text("Рекомендації:"),
            const Text("1. Скоротіть куріння."),
            const Text("2. Збільшіть фізичну активність."),
            const Text("3. Регулярно перевіряйте рівень холестерину."),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text("Повернутися на головну"),
            ),
          ],
        ),
      ),
    );
  }
}
