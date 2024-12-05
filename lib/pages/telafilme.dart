import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TelaFilme extends StatelessWidget {
  final String titulo; // Título do filme
  final String titulofilme;
  final String descricao; // Descrição do filme
  final String imagemPoster; // Caminho do poster do filme
  final String duracao; // Duração do filme
  final String filmeId; // ID do filme para o Player
  final List<String> recomendacoes; // Lista de imagens para recomendações

  const TelaFilme({
    Key? key,
    required this.titulo,
    required this.titulofilme,
    required this.descricao,
    required this.imagemPoster,
    required this.duracao,
    required this.recomendacoes,
    required this.filmeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 390,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagemPoster),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      titulofilme,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'ANTONIO',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 380,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(255, 101, 220, 101), // Cor do botão
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/player',
                      arguments: {'videoId': filmeId},
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: 0,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Assistir',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Antonio'),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 380,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(230, 70, 70, 70), // Cor do botão
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: 0,
                        child: Icon(
                          Icons.download,
                          color: Colors.white70,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Fazer download',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontFamily: 'Antonio'),
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                descricao,
                style: TextStyle(
                  color: Color.fromARGB(255, 150, 150, 150),
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Dê uma avaliação!',
                    style: TextStyle(
                        color: Color.fromARGB(255, 150, 150, 150),
                        fontSize: 17),
                  ),
                ),
                const SizedBox(width: 5),
                FaIcon(FontAwesomeIcons.thumbsDown,
                    color: Color.fromARGB(255, 150, 150, 150), size: 19),
                const SizedBox(width: 10),
                FaIcon(FontAwesomeIcons.thumbsUp,
                    color: Color.fromARGB(255, 150, 150, 150), size: 19),
                const SizedBox(width: 10),
                const Spacer(),
                FaIcon(
                  FontAwesomeIcons.stopwatch,
                  color: Color.fromARGB(255, 150, 150, 150),
                ),
                const SizedBox(width: 8),
                Text(
                  duracao,
                  style: TextStyle(
                    color: Color.fromARGB(255, 150, 150, 150),
                    fontSize: 17,
                    fontFamily: 'Antonio',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              titulo,
              style: TextStyle(
                fontFamily: 'Antonio',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(235, 235, 235, 235),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: recomendacoes.map((recomendacao) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        recomendacao,
                        width: 110,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
