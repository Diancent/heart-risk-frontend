import 'package:flutter/material.dart';
import '../features/risk_prediction/presentation/age_gender_page.dart';
import '../features/risk_prediction/presentation/consent_page.dart';
import '../features/risk_prediction/presentation/ethnicity_page.dart';
import '../features/risk_prediction/presentation/health_conditions_page.dart';
import '../features/risk_prediction/presentation/health_status_page.dart';
import '../features/risk_prediction/presentation/results_page.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const ConsentPage());
      case '/ageGender':
        return MaterialPageRoute(builder: (_) => const AgeGenderPage());
      case '/ethnicityAddress':
        return MaterialPageRoute(builder: (_) => const EthnicityPage());
      case '/lifestyle':
        return MaterialPageRoute(builder: (_) => const HealthStatusPage());
      case '/healthStatus':
        return MaterialPageRoute(builder: (_) => const HealthConditionsPage());
      case '/result':
        return MaterialPageRoute(builder: (_) => const ResultsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('404: Page not found'),
            ),
          ),
        );
    }
  }
}