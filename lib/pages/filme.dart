import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Filme extends StatelessWidget {
  const Filme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/img/djangomovie.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Row(
                    children: [
                      Text(
                        'De uma avaliação!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 150, 150, 150),
                        ),
                      ),
                      SizedBox(width: 6),
                      FaIcon(
                        FontAwesomeIcons.thumbsDown,
                        size: 20,
                        color: Color.fromARGB(255, 150, 150, 150),
                      ),
                      SizedBox(width: 6),
                      FaIcon(
                        FontAwesomeIcons.thumbsUp,
                        size: 20,
                        color: Color.fromARGB(255, 150, 150, 150),
                      ),
                      Spacer(),
                      FaIcon(
                        FontAwesomeIcons.stopwatch,
                        size: 20,
                        color: Color.fromARGB(255, 150, 150, 150),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '2h 44min',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 150, 150, 150),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Veja títulos Semelhantes',
                    style: TextStyle(
                      fontFamily: 'Antonio',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 235, 235, 235),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 187,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        PreviewCard(
                          imageUrl: 'assets/img/banners/osimperdoaveis.jpg',
                          cardHeight: 141,
                          cardWidth: 110,
                        ),
                        PreviewCard(
                          imageUrl: 'assets/img/banners/seteh.jpg',
                          cardHeight: 141,
                          cardWidth: 110,
                        ),
                        PreviewCard(
                          imageUrl: 'assets/img/banners/bastardos.png',
                          cardHeight: 141,
                          cardWidth: 115,
                        ),
                        PreviewCard(
                          imageUrl: 'assets/img/banners/osoito.webp',
                          cardHeight: 141,
                          cardWidth: 110,
                        ),
                        PreviewCard(
                          imageUrl: 'assets/img/banners/12anos.webp',
                          cardHeight: 141,
                          cardWidth: 110,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewCard extends StatelessWidget {
  final String imageUrl;
  final double cardHeight;
  final double cardWidth; // Nova propriedade para controlar a largura

  const PreviewCard({
    required this.imageUrl,
    this.cardHeight = 150, // Altura padrão
    this.cardWidth = 100, // Largura padrão
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: cardWidth, // Largura configurável
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: cardWidth, // Largura da imagem ajustada
              height: cardHeight, // Altura da imagem ajustada
            ),
          ),
        ],
      ),
    );
  }
}
