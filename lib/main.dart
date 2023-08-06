import 'package:accessability_demo_google_io/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      showSemanticsDebugger: true,
      debugShowCheckedModeBanner: false,
      title: 'Accessibility Demo Google I/O',
      home: HomeScreen(),
    );
  }
}
