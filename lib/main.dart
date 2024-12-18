import 'package:flutter/material.dart';
import 'config/theme.dart';

void main() {
  runApp(HeartRiskApp());
}

class HeartRiskApp extends StatelessWidget {
  const HeartRiskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HeartRisk AI',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF031716), // Колір навбару
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Лого зліва
            const Icon(Icons.favorite, color: Colors.tealAccent),
            const SizedBox(width: 8),
            const Text(
              'HeartRisk AI',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Spacer(),

            // Меню опції по центру
            NavigationItem(title: 'Home', onTap: () {}),
            NavigationItem(title: 'Risk Prediction', onTap: () {}),
            NavigationItem(title: 'About', onTap: () {}),
            NavigationItem(title: 'FAQ', onTap: () {}),

            const Spacer(),

            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A7075), // Колір кнопки
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Welcome to HeartRisk AI!',
          style: TextStyle(color: Colors.white, fontSize: 24),
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
