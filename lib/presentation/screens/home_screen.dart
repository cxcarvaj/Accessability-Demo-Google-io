// import 'package:flutter/material.dart';
// import 'package:accessability_demo_google_io/presentation/screens/screens.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           children: [
//             Image.asset(
//               'assets/home_background.jpeg',
//             ),
//             const Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _WelcomeMessage(),
//                 SizedBox(height: 20),
//                 _StartedButton(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _WelcomeMessage extends StatelessWidget {
//   const _WelcomeMessage();

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.only(left: 14, right: 14),
//       child: Text(
//         'Bienvenidos a la demo de accesibilidad',
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//       ),
//     );
//   }
// }

// class _StartedButton extends StatelessWidget {
//   const _StartedButton();

//   @override
//   Widget build(BuildContext context) {
//     return FilledButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginScreen()),
//         );
//       },
//       style: FilledButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         backgroundColor: const Color.fromRGBO(245, 186, 65, 0.9),
//         elevation: 8,
//       ),
//       child: const Text(
//         '¡Empecemos!',
//         style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.w600,
//           fontSize: 18,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:accessability_demo_google_io/presentation/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/home_background.jpeg',
              semanticLabel: 'Imagen de Fondo de Google I/O',
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _WelcomeMessage(),
                SizedBox(height: 20),
                _StartedButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 14, right: 14),
      child: Text(
        'Bienvenidos a la demo de accesibilidad de Google I/O Ecuador',
        semanticsLabel:
            'Bienvenidos a la demo de accesibilidad de Google I/O Ecuador, mensaje de bienvenida a la aplicación',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _StartedButton extends StatelessWidget {
  const _StartedButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: const Color.fromRGBO(245, 186, 65, 0.9),
        elevation: 8,
      ),
      child: const Text(
        '¡Empecemos!',
        semanticsLabel:
            '¡Empecemos!, Botón para ir a la siguiente pantalla de la demo',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
