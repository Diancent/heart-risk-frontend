import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String selectedLanguage = 'ua';

  String getFlagAsset(String languageCode) {
    print('Language code: $languageCode');
    switch (languageCode) {
      case 'ua':
        return 'assets/images/Ukraine.png';
      case 'en':
        return 'assets/images/uk_flag.png';
      default:
        return 'assets/images/Ukraine.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          selectedLanguage = value;
        });
        print('Selected language: $value');
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'ua',
            child: Row(
              children: [
                Image.asset(
                  getFlagAsset('ua'),
                  width: 24,
                  height: 16,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Українська',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'en',
            child: Row(
              children: [
                Image.asset(
                  getFlagAsset('en'),
                  width: 24,
                  height: 16,
                ),
                const SizedBox(width: 8),
                const Text(
                  'English',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ];
      },
      color: Color(0xFF0A7075),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Image.asset(
              getFlagAsset(selectedLanguage),
              width: 28,
              height: 16,
            ),
            const SizedBox(width: 4),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0A7075),
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
                size: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
