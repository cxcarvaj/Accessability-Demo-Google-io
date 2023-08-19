import 'package:flutter/material.dart';

import 'package:accessability_demo_google_io/presentation/widgets/widgets.dart';

import 'package:accessability_demo_google_io/ui/input_decorations.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Pantalla para ingresar a tu cuenta bancaria',
      child: Scaffold(
        appBar: AppBar(
          leading: MergeSemantics(
            child: Semantics(
              label: 'Botón para regresar a la pantalla anterior',
              child: const BackButton(),
            ),
          ),
        ),
        body: AuthBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 150),
                CardContainer(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Login',
                        semanticsLabel: 'Login, título de la pantalla',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const _LoginForm(),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: () {},
                  // onPressed: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const RegisterScreen(),
                  //   ),
                  // ),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      Colors.indigo.withOpacity(0.1),
                    ),
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(),
                    ),
                  ),
                  child: const Text(
                    'Crear una nueva cuenta',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Semantics(
            label: 'Campo para ingresar tu correo electrónico',
            child: TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'user.name@gmail.com',
                labelText: 'Email',
                prefixIcon: Icons.alternate_email,
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Por favor, ingrese un correo válido';
              },
            ),
          ),
          const SizedBox(height: 30),
          Semantics(
            label: 'Campo para ingresar tu contraseña',
            child: TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe tener al menos 6 caracteres';
              },
            ),
          ),
          const SizedBox(height: 30),
          Semantics(
            label: 'Botón para ingresar a tu cuenta bancaria',
            child: ExcludeSemantics(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  if (!loginForm.isValidForm()) return;

                  loginForm.isLoading = true;

                  Future.delayed(const Duration(seconds: 2), () {
                    loginForm.isLoading = false;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Cargando...' : 'Inicio de sesión',
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
