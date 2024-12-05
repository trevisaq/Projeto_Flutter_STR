import 'package:ecofilms/pages/botaoteste.dart';
import 'package:ecofilms/pages/perfis.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecofilms/pages/cadastro.dart';
import 'package:ecofilms/pages/login.dart';
import 'package:ecofilms/pages/home.dart';
import 'package:ecofilms/pages/perfis.dart';
import 'package:ecofilms/pages/player.dart';
import 'package:ecofilms/pages/telafilme.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Garante que a ligação dos widgets do Flutter esteja inicializada antes de usar qualquer plugin
  await Firebase.initializeApp(); // Inicializa o Firebase na aplicação
  runApp(const MyApp()); // Executa a aplicação iniciando pela classe MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Construtor da classe MyApp com uma chave opcional

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
        '/': (context) => Login(),
        '/cadastro': (context) => CadastroScreen(),
        'perfis': (context) => Perfis(),
        '/home': (context) => Home(),
        '/TelaFilme': (context) => TelaFilme(
              titulo: '',
              titulofilme: '',
              descricao: '',
              imagemPoster: '',
              duracao: '',
              recomendacoes: [],
              filmeId: '',
            ),
        '/player': (context) => YoutubeVideoPage(),
      },
    );
  }
}
