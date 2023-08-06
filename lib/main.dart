import 'package:accessability_demo_google_io/config/app_theme.dart';
import 'package:accessability_demo_google_io/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showSemanticsDebugger: true,
      theme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      title: 'Accessibility Demo Google I/O',
      routes: appRoutes,
      initialRoute: '/home',
    );
  }
}
