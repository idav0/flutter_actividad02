import 'package:flutter/material.dart';
import 'package:flutter_actividad1/modules/auth/screens/login.dart';
import 'package:flutter_actividad1/modules/auth/screens/recoverpassword.dart';
import 'package:flutter_actividad1/modules/auth/screens/recoverpasswordnew.dart';
import 'package:flutter_actividad1/modules/auth/screens/recoverpasswordtoken.dart';
import 'package:flutter_actividad1/widgets/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/login' : (context) => const Login(),
        '/recoverpassword' : (context) => const Recoverpassword(),
        '/recoverpasswordtoken' : (context) => const Recoverpasswordtoken(),
        '/recoverpasswordnew' : (context) => const Recoverpasswordnew(),
      },
    );
  }
}


