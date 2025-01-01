import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_risk_ai_frontend/features/risk_prediction/presentation/health_status_page.dart';
import 'package:provider/provider.dart';
import '../../../core/models/heart_risk_model.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_footer.dart';
import '../domain/providers/heart_risk_provider.dart';

class AgeGenderPage extends StatefulWidget {
  const AgeGenderPage({Key? key}) : super(key: key);

  @override
  _AgeGenderPageState createState() => _AgeGenderPageState();
}

class _AgeGenderPageState extends State<AgeGenderPage> {
  final _formKey = GlobalKey<FormState>();

  final List<int> _ages =
      List.generate(100, (index) => index + 1); // 1 to 100 years
  final List<int> _weights =
      List.generate(200, (index) => index + 30); // 30kg to 230kg
  final List<int> _heights =
      List.generate(121, (index) => index + 100); // 100cm to 220cm

  int? _selectedAge;
  int? _selectedWeight;
  int? _selectedHeight;
  int? _selectedGender;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HeartRiskProvider>(context, listen: false);
    _selectedAge = provider.data.age;
    _selectedWeight = provider.data.weight;
    _selectedHeight = provider.data.height;
    _selectedGender = provider.data.gender;
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
                  _buildGenderPicker(provider),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Вік',
                    child: GestureDetector(
                      onTap: () => _showAgePicker(provider),
                      child: Text(
                        _selectedAge != null
                            ? 'Вік: $_selectedAge'
                            : 'Виберіть вік',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Зріст - см',
                    child: GestureDetector(
                      onTap: () => _showHeightPicker(provider),
                      child: Text(
                        _selectedHeight != null
                            ? 'Зріст: $_selectedHeight см'
                            : 'Виберіть зріст',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Вага - кг',
                    child: GestureDetector(
                      onTap: () => _showWeightPicker(provider),
                      child: Text(
                        _selectedWeight != null
                            ? 'Вага: $_selectedWeight кг'
                            : 'Виберіть вагу',
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
      'HeartRisk AI  - це скринінговий інструмент, який допоможе вам зрозуміти стан вашого серця та ризик серцевого нападу та інсульту. Він не є точним для людей, які вже хворіли:',
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildBulletPoints() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Text(
        '• перенесли інфаркт, інсульт або транзиторну ішемічну атаку (ТІА)\n'
        '• стенокардія або захворювання периферичних артерій\n'
        '• стент або перенесли операцію з аортокоронарного шунтування\n'
        '• серйозні психічні захворювання, такі як біполярний розлад, шизофренія, важка депресія або шизоафективний розлад\n',
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _buildGenderPicker(HeartRiskProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Стать',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = 1; // 1 for Male
                  });
                  provider.updateGender(1);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  color: _selectedGender == 1
                      ? Color(0xFF0A7075)
                      : Colors.transparent,
                  child: Text(
                    'Чоловік',
                    style: TextStyle(
                      color: _selectedGender == 1 ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = 2; // 2 for Female
                  });
                  provider.updateGender(2);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  color:
                      _selectedGender == 2 ? Colors.pink : Colors.transparent,
                  child: Text(
                    'Жінка',
                    style: TextStyle(
                      color: _selectedGender == 2 ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
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
              if (_selectedAge == 0 ||
                  _selectedHeight == 0 ||
                  _selectedWeight == 0 ||
                  _selectedGender == null) {
                // Вивести повідомлення, якщо значення 0
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Будь ласка, заповніть всі поля коректно!'),
                  ),
                );
              } else {
                // Якщо всі поля коректні, оновлюємо модель
                provider.updateData(
                  age: _selectedAge!,
                  gender: _selectedGender!,
                  height: _selectedHeight!,
                  weight: _selectedWeight!,
                  isSmoke: 0,
                  isAlco: 0,
                  isActive: 0,
                  gluc: 0, // Рівень глюкози
                  cholesterol: 0, // Рівень холестерину
                  apHi: 0, // Систолічний артеріальний тиск
                  apLo: 0, // Діастолічний артеріальний тиск
                );

                final heartRiskData =
                    provider.data; // отримуємо актуальні дані з провайдера
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HealthStatusPage(heartRiskData: heartRiskData),
                  ),
                );

                print("Test data");
                print(heartRiskData);
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

  void _showAgePicker(HeartRiskProvider provider) {
    showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: _selectedAge ?? 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedAge = _ages[index];
            });
            provider.updateAge(_selectedAge!);
          },
          children: _ages
              .map((age) => Text(
                    age.toString(),
                    style: const TextStyle(fontSize: 24),
                  ))
              .toList(),
        );
      },
    );
  }

  void _showWeightPicker(HeartRiskProvider provider) {
    showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: _selectedWeight ?? 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedWeight = _weights[index];
            });
            provider.updateWeight(_selectedWeight!);
          },
          children: _weights
              .map((weight) => Text(
                    weight.toString(),
                    style: const TextStyle(fontSize: 24),
                  ))
              .toList(),
        );
      },
    );
  }

  void _showHeightPicker(HeartRiskProvider provider) {
    showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: _selectedHeight ?? 0,
          ),
          itemExtent: 32,
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedHeight = _heights[index];
            });
            provider.updateHeight(_selectedHeight!);
          },
          children: _heights
              .map((height) => Text(
                    height.toString(),
                    style: const TextStyle(fontSize: 24),
                  ))
              .toList(),
        );
      },
    );
  }
}
