import 'package:flutter/material.dart';

class Filme extends StatelessWidget {
  const Filme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Imagem que preenche a largura da tela
          Image.asset(
            'assets/img/djangomovie.png', // Substitua pelo caminho da sua imagem
            width: double.infinity, // Preenche a largura da tela
            fit: BoxFit
                .fitWidth, // Ajusta a imagem para ocupar toda a largura mantendo a proporção original
          ),
          Container(
            width: 400,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/player');
                  },
                  child: Image.asset('assets/img/play.button.png'),
                ),
                SizedBox(height: 10),
                Image.asset('assets/img/down.button.png'),
                SizedBox(height: 10),
                Text(
                  'No sul dos Estados Unidos, o ex-escravo Django faz uma aliança inesperada com o caçador de recompensas Schultz para perseguir os criminosos mais procurados do país e resgatar sua esposa de um fazendeiro que força seus escravos a entrarem em competições mortais.',
                  style: TextStyle(color: Color.fromARGB(255, 150, 150, 150)),
                ),
                SizedBox(height: 12),
                Text('De uma avaliação!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 150, 150, 150)
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
