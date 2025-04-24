import 'package:flutter/material.dart';
import 'signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const OnboardPage(
      imagePath: 'assets/images/cozzyy.png',
      title: 'Welcome to Polyspace!',
      subtitle: 'Your cozy digital spot.',
    ),
    const OnboardPage(
      imagePath: 'assets/images/vozzyyy.png',
      title: 'Organize your life',
      subtitle: 'Keep everything in one place.',
    ),
    const OnboardPage(
      imagePath: 'assets/images/lozzyyy.png',
      title: 'Ready to begin?',
      subtitle: 'Let’s get you started.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: _pages,
          ),
          Positioned(
            bottom: 60,
            left: 24,
            right: 24,
            child: _currentIndex == 2
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'GET STARTED',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const OnboardPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(32),
          child: Stack( // Changed to Stack to allow absolute positioning
            children: [
              Positioned(
                left: 12, // X position
                top: 122, // Y position
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: 19,
                top: 164,
                child: Text(
                  subtitle,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
