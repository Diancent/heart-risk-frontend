import 'package:flutter/material.dart';
import 'package:heart_risk_ai_frontend/core/widgets/custom_app_bar.dart';
import 'package:heart_risk_ai_frontend/core/widgets/custom_footer.dart';

class ResultsPage extends StatelessWidget {
  final int prediction;
  final double diseaseProbability;
  final List<String> recommendations;
  const ResultsPage(
      {Key? key,
      required this.prediction,
      required this.diseaseProbability,
      required this.recommendations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Text(
                "Ваші результати",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      prediction == 0 ? "OK" : "Ризик",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: prediction == 0 ? Color(0xFF0a6f78) : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Ваша ймовірність захворювання: ${diseaseProbability.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Рекомендації:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    ...recommendations.map(
                      (rec) => Text(
                        rec,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 200),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
