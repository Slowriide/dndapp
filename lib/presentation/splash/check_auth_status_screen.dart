import 'package:dnd_app/presentation/auth/main_login_screen.dart';
import 'package:dnd_app/presentation/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mostramos pantalla de carga mientras se verifica
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // Usuario autenticado, redirigimos al Home
          return const HomePage(pageIndex: 0);
        } else {
          // Usuario no autenticado, redirigimos al Login
          return const MainLoginScreen();
        }
      },
    );
  }
}
