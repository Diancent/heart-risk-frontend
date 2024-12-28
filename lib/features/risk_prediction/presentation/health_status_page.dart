import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_footer.dart';
import '../domain/providers/heart_risk_provider.dart';

class HealthStatusPage extends StatelessWidget {
  const HealthStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HeartRiskProvider>(context);
    final List<String> options = ["Так", "Ні"];

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRichText('Ви курите?', '(Обов\'язково)'),
                            const SizedBox(height: 5),
                            _buildDropdownOption(
                              values: options,
                              selectedValue:
                                  provider.data.isSmoke == 1 ? "Так" : "Ні",
                              onChanged: (value) {
                                provider.updateSmokingStatus(
                                    value == "Так" ? 1 : 0);
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildRichText(
                                'Ви вживаєте алкоголь?', '(Обов\'язково)'),
                            const SizedBox(height: 5),
                            _buildDropdownOption(
                              values: options,
                              selectedValue:
                                  provider.data.isAlco == 1 ? "Так" : "Ні",
                              onChanged: (value) {
                                provider.updateAlcoholStatus(
                                    value == "Так" ? 1 : 0);
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildRichText(
                                'Ви фізично активні?', '(Обов\'язково)'),
                            const SizedBox(height: 5),
                            _buildDropdownOption(
                              values: options,
                              selectedValue:
                                  provider.data.isActive == 1 ? "Так" : "Ні",
                              onChanged: (value) {
                                provider.updateActivityStatus(
                                    value == "Так" ? 1 : 0);
                              },
                            ),
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
            SizedBox(height: 100),
            Footer()
          ],
        ),
      ),
    );
  }

  Widget _buildRichText(String text, String requiredText) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: requiredText,
            style: const TextStyle(fontSize: 15, color: Color(0xFF0A7075)),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownOption({
    required List<String> values,
    required String selectedValue,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: values
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Оберіть відповідь',
        labelStyle: const TextStyle(fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        isDense: true,
      ),
      isExpanded: true,
    );
  }

  Widget _buildTextFieldOption({
    required String label,
    required String initialValue,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        isDense: true,
      ),
      keyboardType: TextInputType.number,
      controller: TextEditingController(text: initialValue),
      onChanged: onChanged,
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
            'Далі',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
