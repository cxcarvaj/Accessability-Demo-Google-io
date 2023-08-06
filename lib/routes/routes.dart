import 'package:flutter/material.dart';
import 'package:accessability_demo_google_io/presentation/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/home': (_) => const HomeScreen(),
  '/form': (_) => const FormScreen()
};
