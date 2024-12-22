import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heart_risk_ai_frontend/core/widgets/language_selector.dart';
import 'package:heart_risk_ai_frontend/core/widgets/social_icons.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/heart_logo.png',
                    width: 27,
                    height: 34,
                  ),
                  SizedBox(width: 5),
                  const Text(
                    'HeartRisk AI',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D9696),
                    ),
                  ),
                ],
              ),

              // Авторське право
              const Text(
                '© 2024 HeartRisk AI • All Rights Reserved',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF0A142F),
                ),
                textAlign: TextAlign.center,
              ),
              SocialIcons(),
              LanguageSelector()
            ],
          ),
        ],
      ),
    );
  }

  // Метод для побудови соціальних іконок
  Widget _buildSocialIcon(String assetPath) {
    return Container(
      child: SvgPicture.asset(
        assetPath,
        height: 20,
        width: 20,
        color: Colors.black87,
      ),
    );
  }
}
