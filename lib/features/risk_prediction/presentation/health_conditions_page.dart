import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  int? _gluc;
  int? _cholesterol;
  int? _apHi;
  int? _apLo;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HeartRiskProvider>(context, listen: false);
    _gluc = provider.data.gluc;
    _cholesterol = provider.data.cholesterol;
    _apHi = provider.data.apHi;
    _apLo = provider.data.apLo;
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
                      child: Text(
                        _gluc != null && _gluc != 0
                            ? 'Глюкоза: $_gluc'
                            : 'Виберіть рівень глюкози',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Рівень холестерину',
                    child: GestureDetector(
                      onTap: () => _showCholesterolPicker(provider),
                      child: Text(
                        _cholesterol != null && _cholesterol != 0
                            ? 'Холестерин: $_cholesterol'
                            : 'Виберіть рівень холестерину',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Check if any value is 0
              if (_gluc == null ||
                  _gluc == 0 ||
                  _cholesterol == null ||
                  _cholesterol == 0 ||
                  _apHi == null ||
                  _apHi == 0 ||
                  _apLo == null ||
                  _apLo == 0) {
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

                final heartRiskData = provider.data;

                // Перетворюємо модель в JSON
                final heartRiskJson = heartRiskData.toJson();

                // Виводимо JSON дані у консоль (для налагодження)
                print("HeartRisk JSON Data: $heartRiskJson");

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultsPage(heartRiskData: heartRiskData),
                  ),
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0A7075),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
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
            initialItem: _gluc ?? 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _gluc = index;
            });
            provider.updateGluc(_gluc!);
          },
          children: List.generate(200, (index) => Text((index).toString())),
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
            initialItem: _cholesterol ?? 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _cholesterol = index;
            });
            provider.updateCholesterol(_cholesterol!);
          },
          children: List.generate(300, (index) => Text((index).toString())),
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
            initialItem: _apHi ?? 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _apHi = index;
            });
            provider.updateApHi(_apHi!);
          },
          children: List.generate(200, (index) => Text((index).toString())),
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
            initialItem: _apLo ?? 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _apLo = index;
            });
            provider.updateApLo(_apLo!);
          },
          children: List.generate(200, (index) => Text((index).toString())),
        );
      },
    );
  }
}
