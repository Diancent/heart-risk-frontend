import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../domain/providers/heart_risk_provider.dart';

class EthnicityPage extends StatelessWidget {
  const EthnicityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HeartRiskProvider>(context, listen: false);
    final List<String> ethnicities = [
      'Маорі',
      'Європейці',
      'Азіати',
      'Тихоокеанські народи',
      'Африканці',
      'Інші'
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
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
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const Text(
                          'Оберіть вашу етнічну приналежність. Це допоможе нам краще оцінити ваші ризики для здоров’я:',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 12),
                        _buildDropdown(provider, ethnicities),
                        const SizedBox(height: 30),
                        const Text(
                          'Домашня Адреса',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Якщо ви не можете знайти свою адресу, будь ласка, залиште це поле порожнім',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        _buildAddressField(provider),
                        const SizedBox(height: 30),
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

  Widget _buildDropdown(HeartRiskProvider provider, List<String> ethnicities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Етнічна приналежність',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: provider.data.ethnicity.isNotEmpty
              ? provider.data.ethnicity
              : null,
          items: ethnicities.map((ethnicity) {
            return DropdownMenuItem<String>(
              value: ethnicity,
              child: Text(ethnicity),
            );
          }).toList(),
          onChanged: (String? value) {
            if (value != null) provider.updateEthnicity(value);
          },
          decoration: InputDecoration(
            labelText: 'Оберіть відповідь',
            labelStyle: const TextStyle(fontSize: 13),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            isDense: true,
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
        ),
      ],
    );
  }

  Widget _buildAddressField(HeartRiskProvider provider) {
    return TextFormField(
      onChanged: (value) {
        provider.updateAddress(value);
      },
      decoration: InputDecoration(
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
          onPressed: () => Navigator.pushNamed(context, '/lifestyle'),
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
