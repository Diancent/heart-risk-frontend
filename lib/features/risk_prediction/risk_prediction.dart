import 'package:flutter/material.dart';
import '../../core/widgets/custom_app_bar.dart';
import 'package:flutter/gestures.dart';

import '../../core/widgets/custom_footer.dart';

class RiskPredictionPage extends StatefulWidget {
  const RiskPredictionPage({Key? key}) : super(key: key);

  @override
  State<RiskPredictionPage> createState() => _RiskPredictionPageState();
}

class _RiskPredictionPageState extends State<RiskPredictionPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 575,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        const Text(
                          'Перевірка серця',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'HeartRisk AI оцінює вік вашого серця та ділиться порадами, які допоможуть покращити його здоров\'я. HeartRisk AI не надає медичних порад. Будь ласка, поговоріть зі своїм лікарем, якщо вас турбує ваше серце.',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'HeartRisk AI призначений для людей віком від 30 до 75 років. Ви можете використовувати його, якщо ви старші або молодші за цей вік, але ваші результати можуть бути не такими точними.',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Якщо ви вважаєте, що у вас симптоми серцевого нападу, зателефонуйте 103.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(
                              0xFF0A7075,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 575,
                    child: Stack(
                      clipBehavior: Clip.none, // Дозволяє вихід за межі Card
                      children: [
                        // Карточка
                        Card(
                          color: Color(0xFFEDEDEE),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(73.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Важлива інформація',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 28),
                                  child: const Text(
                                    '• HeartRisk AI розраховує показники здоров\'я вашого серця та ризик серцевого нападу або інсульту. Він базується на розрахунках, які враховують ваш вік, стать, артеріальний тиск, рівень холестерину, наявність шкідливих звичок, таких як паління, та інші фактори, що впливають на здоров\'я серцево-судинної системи.\n'
                                    '• Цей інструмент не призначений для тих, хто переніс інфаркт, інсульт або має серцеві захворювання - якщо це саме про вас, зверніться до лікаря за порадою щодо здоров\'я вашого серця.\n'
                                    '• Інструмент збирає інформацію від вас і використовує її для обчислення вашого балу здоров\'я серця.\n'
                                    '• Ми видаляємо будь-яку ідентифіковану інформацію про вас після того, як надамо вам ваш бал, і використовуємо деідентифіковану інформацію для аналізу та покращення роботи інструменту.\n'
                                    '• Ви не зобов\'язані відповідати на всі запитання, але якщо ви цього не зробите, ваш результат буде менш точним.',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                CheckboxListTile(
                                  value: isChecked,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                  title: const Text(
                                    'Я розумію, що цей інструмент не надає медичної консультації.',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: Color(0xFF0A7075),
                                ),
                                const SizedBox(height: 15),
                                RichText(
                                  text: TextSpan(
                                    text: 'Прочитайте нашу ',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: 'заяву про конфіденційність',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF6CA5C2),
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Логіка переходу
                                          },
                                      ),
                                      const TextSpan(
                                        text:
                                            ', як HeartRisk AI управляє і використовує вашу особисту інформацію.',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Кнопка, що виходить за межі Card
                        Positioned(
                          bottom: -14, // Зміщує кнопку вниз від Card
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: isChecked
                                  ? () {
                                      // Додати функціонал для кнопки
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0A7075),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31),
                                ),
                                elevation: 5, // Додає тінь кнопці
                              ),
                              child: const Text(
                                'Почати',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NavigationItem({required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}
