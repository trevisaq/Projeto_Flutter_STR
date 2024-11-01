import 'package:ecofilms/pages/login.dart';
import 'package:ecofilms/pages/cadastro.dart';
import 'package:ecofilms/pages/splash.dart';
import 'package:ecofilms/pages/home.dart';
import 'package:ecofilms/pages/player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/', // Mudar para a página de splash
      routes: {
        // Rota para a página de splash
        '/': (context) => Splash(),
        '/login': (context) => Login(),
        '/cadastro': (context) => Cadastro(),
        '/home': (context) => Home(),
        '/player': (context) => YoutubeVideoPage(),
      },
    );
  }
}
