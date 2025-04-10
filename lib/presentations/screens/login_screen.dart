// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practica2/data/registered_users.dart';
import 'package:practica2/domain/user_models.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  // Expresión regular para validar un email
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

 void _login() {
  setState(() {
    errorMessage = null; // Resetea el error

    if (emailController.text.isEmpty || !emailController.text.contains('@')) {
      errorMessage = 'email';
    } else if (passwordController.text.isEmpty) {
      errorMessage = 'password';
    } else {
      // Buscar al usuario que coincida con el correo y la contraseña
      User? loggedInUser;
      for (var user in usersRegistered) {
        if (user.email == emailController.text && user.password == passwordController.text) {
          loggedInUser = user;
          break;
        }
      }

      if (loggedInUser != null) {
        // Si el usuario está registrado y las credenciales son correctas
        Future.delayed(Duration.zero, () {
          context.push('/phones', extra: loggedInUser);  // Pasamos el usuario al navegar a la pantalla de inicio
        });
      } else {
        // Si el inicio de sesión falla
        setState(() {
          errorMessage = 'generic';
        });
      }
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Campo de correo electrónico
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                errorText: errorMessage == 'email' ? 'Please enter a valid email' : null,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),

            // Campo de contraseña
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                errorText: errorMessage == 'password' ? 'Password cannot be empty' : null,
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),

            // Botón de inicio de sesión
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Text('Login'),
            ),

            // Mensaje de error (si es necesario)
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  errorMessage == 'generic' ? 'Invalid email or password' : '',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
