import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/onboarding_screen.dart'; // Import your OnboardingScreen
//import 'sign_in_screen.dart'; // Remove this import to avoid conflicts and use OnboardingScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Addded const

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Added debugShowCheckedModeBanner
      title: 'PolySpace', // Added a title
      home: const OnboardingScreen(), // Use OnboardingScreen as the starting screen
    );
  }
}
