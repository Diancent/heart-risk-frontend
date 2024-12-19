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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 575,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildInfoCard(provider, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(HeartRiskProvider provider, BuildContext context) {
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
                  _buildInputField(
                    title: 'Вік',
                    isRequired: true,
                    child: _buildTextField((value) {}),
                  ),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Біологічна стать',
                    isRequired: true,
                    extraInfo: 'Навіщо це потрібно?',
                    child: _buildGenderDropdown(provider),
                  ),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Зріст - см',
                    subtitle: 'Залиште це поле порожнім, якщо ви не знаєте',
                    child: _buildTextField((value) {}),
                  ),
                  const SizedBox(height: 25),
                  _buildInputField(
                    title: 'Вага - кг',
                    subtitle: 'Залиште це поле порожнім, якщо ви не знаєте',
                    child: _buildTextField((value) {}),
                  ),
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

  Widget _buildInputField({
    required String title,
    bool isRequired = false,
    String? subtitle,
    String? extraInfo,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: isRequired
                ? [
                    const TextSpan(
                      text: ' (Обов\'язково)',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF0A7075),
                      ),
                    ),
                  ]
                : null,
          ),
        ),
        if (extraInfo != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              extraInfo,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6CA5C2),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        const SizedBox(height: 5),
        child,
      ],
    );
  }

  Widget _buildTextField(ValueChanged<String> onChanged) {
    return TextField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        isDense: true,
        border: OutlineInputBorder(),
      ),
      cursorColor: Colors.black,
      onChanged: onChanged,
    );
  }

  Widget _buildGenderDropdown(HeartRiskProvider provider) {
    return DropdownButtonFormField<String>(
      value: provider.data.gender.isEmpty ? null : provider.data.gender,
      onChanged: (value) => provider.updateGender(value!),
      items: ['Чоловік', 'Жінка']
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      decoration: InputDecoration(
        labelText: 'Оберіть відповідь',
        labelStyle: const TextStyle(fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        isDense: true,
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
          onPressed: () => Navigator.pushNamed(context, '/ethnicityAddress'),
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
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
