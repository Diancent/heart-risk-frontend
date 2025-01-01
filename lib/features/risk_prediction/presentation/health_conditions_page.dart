import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_risk_ai_frontend/core/services/api_service.dart';
import 'package:heart_risk_ai_frontend/features/risk_prediction/presentation/health_status_page.dart';
import 'package:heart_risk_ai_frontend/features/risk_prediction/presentation/results_page.dart';
import 'package:provider/provider.dart';
import '../../../core/models/heart_risk_model.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_footer.dart';
import '../domain/providers/heart_risk_provider.dart';

class HealthConditionsPage extends StatefulWidget {
  const HealthConditionsPage({Key? key}) : super(key: key);

  @override
  _HealthConditionsPageState createState() => _HealthConditionsPageState();
}

class _HealthConditionsPageState extends State<HealthConditionsPage> {
  final _formKey = GlobalKey<FormState>();

  int? _gluc = null; // null означає, що рівень глюкози не вибраний
  int? _cholesterol = null;
  int? _apHi;
  int? _apLo;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HeartRiskProvider>(context, listen: false);
    _gluc = provider.data.gluc ?? null;
    _cholesterol = provider.data.cholesterol ?? null;
    _apHi = provider.data.apHi ?? 120; // Default to 120 if no value is set
    _apLo = provider.data.apLo ?? 80; // Default to 80 if no value is set
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HeartRiskProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 575,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildInfoCard(provider),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            const Footer()
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(HeartRiskProvider provider) {
    return SizedBox(
      width: 575,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: const Color(0xFFEDEDEE),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(73.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderText(),
                  const SizedBox(height: 12),
                  _buildBulletPoints(),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Рівень глюкози',
                    child: GestureDetector(
                      onTap: () => _showGlucPicker(provider),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _gluc == 0
                                ? 'Виберіть рівень глюкози' // Початковий текст
                                : _gluc == 1
                                    ? 'Норма (1.0 - 5.17 ммоль/л)' // Пояснення для норми
                                    : _gluc == 2
                                        ? 'Вище норми (5.18 - 6.18 ммоль/л)' // Для трохи вищого рівня
                                        : 'Значно вище норми (6.21 - 7.21 ммоль/л)', // Для значно вищого рівня
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Рівень холестерину',
                    child: GestureDetector(
                      onTap: () => _showCholesterolPicker(provider),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _cholesterol == 0
                                ? 'Виберіть рівень холестерину' // If cholesterol is null, show this text
                                : _cholesterol == 1
                                    ? 'Норма (3.5 - 5.7 ммоль/л)' // If cholesterol is 1, show 'Норма'
                                    : _cholesterol == 2
                                        ? 'Вище норми (5.7 - 6.9 ммоль/л)' // If cholesterol is 2, show 'Вище норми'
                                        : 'Значно вище норми (7.0 - 10.4 ммоль/л)', // If cholesterol is 3, show 'Значно вище норми'
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Систолічний артеріальний тиск',
                    child: GestureDetector(
                      onTap: () => _showApHiPicker(provider),
                      child: Text(
                        _apHi != null && _apHi != 0
                            ? 'Систолічний тиск: $_apHi'
                            : 'Виберіть систолічний артеріальний тиск',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Діастолічний артеріальний тиск',
                    child: GestureDetector(
                      onTap: () => _showApLoPicker(provider),
                      child: Text(
                        _apLo != null && _apLo != 0
                            ? 'Діастолічний тиск: $_apLo'
                            : 'Виберіть діастолічний артеріальний тиск',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -18,
            left: 0,
            right: 0,
            child: _buildButtons(context, provider),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderText() {
    return const Text(
      'Додайте дані про ваше здоров\'я для точнішої оцінки ризику серцевих захворювань:',
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildBulletPoints() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Text(
        '• Рівень глюкози, холестерину та артеріальний тиск важливі для оцінки ризику серцевого захворювання.',
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _buildInputField({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        child,
      ],
    );
  }

  Widget _buildButtons(BuildContext context, HeartRiskProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0C9696),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31),
            ),
            elevation: 5,
          ),
          child: const Text(
            'Назад',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              // Check if any value is 0
              if (_gluc == null ||
                  _gluc == 0 ||
                  _cholesterol == null ||
                  _cholesterol == 0 ||
                  _apHi == null ||
                  _apHi == 0 ||
                  _apHi! < 50 ||
                  _apHi! > 300 ||
                  _apLo == null ||
                  _apLo == 0 ||
                  _apLo! < 30 ||
                  _apLo! > 200) {
                // Show error if fields are not correctly filled
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Будь ласка, заповніть всі поля коректно!'),
                  ),
                );
              } else {
                // Update the data and navigate
                provider.updateData(
                  gluc: _gluc!,
                  cholesterol: _cholesterol!,
                  apHi: _apHi!,
                  apLo: _apLo!,
                );

                final heartRiskData = provider.data.toJson();
                print("HeartRisk JSON Data: $heartRiskData");

                // Перетворюємо модель у JSON
                // final heartRiskJson = heartRiskData.toJson();
                // print(
                //     "HeartRisk JSON Data: $heartRiskJson"); // Логування для перевірки

                try {
                  final response =
                      await HeartRiskService().sendHeartRiskData(heartRiskData);

                  // Перетворення JSON-відповіді у Map
                  final jsonResponse =
                      response; // Передбачається, що `response` вже JSON

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        prediction: jsonResponse['prediction'], // int
                        diseaseProbability:
                            jsonResponse['disease_probability'], // double
                        recommendations: List<String>.from(
                            jsonResponse['recommendations']), // List<String>
                      ),
                    ),
                  );
                } catch (e, stacktrace) {
                  print("Error: $e");
                  print("Stacktrace: $stacktrace");

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Помилка під час обробки запиту. Спробуйте пізніше.'),
                    ),
                  );
                }
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0A7075),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 17),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31),
            ),
            elevation: 5,
          ),
          child: const Text(
            'Далі',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _showGlucPicker(HeartRiskProvider provider) {
    showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: _gluc != null ? _gluc! - 1 : 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _gluc = index + 1; // Set the value to 1, 2, or 3
            });
            provider.updateGluc(_gluc!);
          },
          children: const [
            Text('Норма'), // Value 1
            Text('Вище норми'), // Value 2
            Text('Значно вище норми'), // Value 3
          ],
        );
      },
    );
  }

  void _showCholesterolPicker(HeartRiskProvider provider) {
    showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: _cholesterol != null ? _cholesterol! - 1 : 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _cholesterol = index + 1; // Set the value to 1, 2, or 3
            });
            provider.updateCholesterol(_cholesterol!);
          },
          children: const [
            Text('Норма'), // Value 1
            Text('Вище норми'), // Value 2
            Text('Значно вище норми'), // Value 3
          ],
        );
      },
    );
  }

  void _showApHiPicker(HeartRiskProvider provider) {
    showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: _apHi != null ? _apHi! - 50 : 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _apHi = index + 50; // Додаємо 50, щоб значення починались з 50
            });
            provider.updateApHi(_apHi!);
          },
          children:
              List.generate(250, (index) => Text((index + 50).toString())),
        );
      },
    );
  }

  void _showApLoPicker(HeartRiskProvider provider) {
    showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: _apLo != null ? _apLo! - 30 : 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _apLo = index + 30; // Додаємо 30, щоб значення починались з 30
            });
            provider.updateApLo(_apLo!);
          },
          children:
              List.generate(170, (index) => Text((index + 30).toString())),
        );
      },
    );
  }
}
