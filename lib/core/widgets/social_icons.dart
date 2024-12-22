import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon('assets/icons/fb_icon.svg'),
        const SizedBox(width: 20),
        _buildIcon('assets/icons/linkedin_icon.svg'),
        const SizedBox(width: 20),
        _buildIcon('assets/icons/twitter_icon.svg'),
      ],
    );
  }

  Widget _buildIcon(String assetPath) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFFDADCE0),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(
          assetPath,
          height: 12,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
