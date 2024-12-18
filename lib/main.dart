import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'features/risk_prediction/risk_prediction.dart';

void main() {
  runApp(HeartRiskApp());
}

class HeartRiskApp extends StatelessWidget {
  const HeartRiskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HeartRisk AI',
      theme: AppTheme.lightTheme,
      home: const RiskPredictionPage(),
    );
  }
}
