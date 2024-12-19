import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../domain/providers/heart_risk_provider.dart';

class HealthConditionsPage extends StatefulWidget {
  const HealthConditionsPage({Key? key}) : super(key: key);

  @override
  _HealthConditionsPageState createState() => _HealthConditionsPageState();
}

class _HealthConditionsPageState extends State<HealthConditionsPage> {
  final List<String> conditions = [
    "У мене діабет",
    "У мене є сімейний анамнез серцевих захворювань або інсульту",
    "У мене миготлива аритмія",
    "Я приймаю ліки від високого кров'яного тиску",
    "Я приймаю ліки від високого рівня холестерину",
    "Я приймаю ліки від тромбів",
    "Нічого з перерахованого"
  ];
  final List<String> selectedConditions = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HeartRiskProvider>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width:
                screenWidth > 600 ? 575 : screenWidth * 0.9, // Адаптуємо ширину
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
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Стан здоров'я",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: "Навіщо це потрібно?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF6CA5C2),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        const Text("Відмітьте пункти, які стосуються вас"),
                        const SizedBox(height: 10),
                        // Створюємо контейнер для ListView, щоб уникнути проблем з розмірами
                        Container(
                          height: 300, // Фіксована висота
                          child: ListView.builder(
                            itemCount: conditions.length,
                            itemBuilder: (context, index) {
                              final condition = conditions[index];
                              return CheckboxListTile(
                                title: Text(condition),
                                value: selectedConditions.contains(condition),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                activeColor: Color(0xFF0A7075),
                                onChanged: (value) {
                                  setState(() {
                                    if (value == true) {
                                      selectedConditions.add(condition);
                                    } else {
                                      selectedConditions.remove(condition);
                                    }
                                    provider.updateHealthConditions(
                                        selectedConditions);
                                  });
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -18,
                  left: 0,
                  right: 0,
                  child: _buildButtons(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
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
          onPressed: () => Navigator.pushNamed(context, '/result'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0A7075),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 17),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31),
            ),
            elevation: 5,
          ),
          child: const Text(
            'Результат',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
