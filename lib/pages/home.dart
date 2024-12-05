import 'package:ecofilms/pages/player.dart';
import 'package:ecofilms/pages/telafilme.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      
                      Positioned.fill(
                        child: Image.asset(
                          'assets/img/banners/darknight.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                              stops: [0.5, 1],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 10,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/img/icons/logo.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'ORIGINAL ECO',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => TelaFilme(
                                                    titulofilme:
                                                        'Batman - The dark knight',
                                                    titulo:
                                                        'Gosta de filmes de heroi?',
                                                    descricao:
                                                        'Batman tem conseguido manter a ordem em Gotham com a ajuda de Jim Gordon e Harvey Dent. No entanto, um jovem e anárquico criminoso, conhecido apenas como Coringa, pretende testar o Cavaleiro das Trevas e mergulhar a cidade em um verdadeiro caos.',
                                                    imagemPoster:
                                                        'assets/img/filmephotos/thedarkknight.photo.png',
                                                    duracao: '2h 32m',
                                                    recomendacoes: [
                                                      'assets/img/banners/batman.sugg/sugg1.png',
                                                      'assets/img/banners/batman.sugg/sugg2.png',
                                                      'assets/img/banners/batman.sugg/sugg3.png',
                                                      'assets/img/banners/batman.sugg/sugg4.png',
                                                    ],
                                                    filmeId: 'jane6C4rIwc',
                                                  )),
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.info_outline,
                                              color: Colors.white),
                                          SizedBox(height: 5),
                                          Text(
                                            'Detalhes',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaFilme(
                                            titulofilme:
                                                'Spiderman into spiderverse',
                                            titulo:
                                                'Veja mais da familia Spider',
                                            descricao:
                                                'Miles Morales, um jovem negro do Brooklyn, é transformado no Homem-Aranha após ser atingido por uma teia radioativa, inspirando-se no legado do falecido Peter Parker. Porém, ao visitar o túmulo de Peter em uma noite chuvosa, ele se depara com uma versão dele viva, vinda de uma dimensão paralela. Logo, Miles descobre que há outras versões do Homem-Aranha vindas de diferentes realidades.',
                                            imagemPoster:
                                                'assets/img/filmephotos/spiderman.photo.png',
                                            duracao: '1h 56m',
                                            recomendacoes: [
                                              'assets/img/banners/spider.sugg/sugg1.jpg',
                                              'assets/img/banners/spider.sugg/sugg2.jpg',
                                              'assets/img/banners/spider.sugg/sugg3.jpg',
                                              'assets/img/banners/spider.sugg/sugg4.png',
                                            ],
                                            filmeId:
                                                'FcP3zSpCHYM',
                                          )),
                                );
                              },
                              child:
                                  PreviewCard('assets/img/banners/spider.png'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaFilme(
                                            titulofilme: 'Django livre',
                                            titulo:
                                                'Veja mais sobre a tematica',
                                            descricao:
                                                'No sul dos Estados Unidos, o ex-escravo Django faz uma aliança inesperada com o caçador de recompensas Schultz para perseguir os criminosos mais procurados do país e resgatar sua esposa de um fazendeiro que força seus escravos a entrarem em competições mortais.',
                                            imagemPoster:
                                                'assets/img/filmephotos/django.photo.png',
                                            duracao: '2h 45min',
                                            recomendacoes: [
                                              'assets/img/banners/django.sugg/12anos.webp',
                                              'assets/img/banners/django.sugg/seteh.jpg',
                                              'assets/img/banners/django.sugg/osoito.webp',
                                              'assets/img/banners/django.sugg/osimperdoaveis.jpg',
                                            ],
                                            filmeId: 'hglyRJXCNCM',
                                          )),
                                );
                              },
                              child: PreviewCard(
                                  'assets/img/banners/django.png'), 
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaFilme(
                                            titulofilme: 'Baby Driver',
                                            titulo: 'Que tal uma acelerada?',
                                            descricao:
                                                'Baby, um motorista de fuga talentoso, usa a música para se concentrar e silenciar um zumbido causado por um acidente na infância. Quando conhece a mulher dos seus sonhos, ele vê uma chance de mudar de vida. No entanto, preso a um chefão do crime, ele precisa lidar com a música e uma missão perigosa que coloca em risco seu amor, liberdade e futuro.',
                                            imagemPoster:
                                                'assets/img/filmephotos/babydriver.photo.png',
                                            duracao: '1h 55m',
                                            recomendacoes: [
                                              'assets/img/banners/babydriver.sugg/sugg1.png',
                                              'assets/img/banners/babydriver.sugg/sugg2.png',
                                              'assets/img/banners/babydriver.sugg/sugg3.png',
                                              'assets/img/banners/babydriver.sugg/sugg4.png',
                                            ],
                                            filmeId: '6XMuUVw7TOM',
                                          )),
                                );
                              },
                              child: PreviewCard(
                                  'assets/img/banners/babydriver.png'), 
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaFilme(
                                            titulofilme: 'Bastardos Inglórios',
                                            titulo:
                                                'Veja mais de Quentin Tarantino',
                                            descricao:
                                                'Durante a Segunda Guerra Mundial, na França, judeus americanos espalham o terror entre o terceiro Reich. Ao mesmo tempo, Shosanna, uma judia que fugiu dos nazistas, planeja vingança quando um evento em seu cinema reunirá os líderes do partido.',
                                            imagemPoster:
                                                'assets/img/filmephotos/bastardos.photo.png',
                                            duracao: '2h 33m',
                                            recomendacoes: [
                                              'assets/img/banners/bastardos.sugg/sugg1.png',
                                              'assets/img/banners/bastardos.sugg/sugg2.png',
                                              'assets/img/banners/bastardos.sugg/sugg3.png',
                                              'assets/img/banners/bastardos.sugg/sugg4.png',
                                            ],
                                            filmeId: 'MDiSowu8LmA',
                                          )),
                                );
                              },
                              child: PreviewCard(
                                  'assets/img/banners/bastardos.png'), 
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaFilme(
                                            titulofilme: 'Coringa',
                                            titulo: 'Filmes sobre Psicológico',
                                            descricao:
                                                'Isolado, intimidado e desconsiderado pela sociedade, o fracassado comediante Arthur Fleck inicia seu caminho como uma mente criminosa após assassinar três homens em pleno metrô. Sua ação inicia um movimento popular contra a elite de Gotham City, da qual Thomas Wayne é seu maior representante.',
                                            imagemPoster:
                                                'assets/img/filmephotos/joker.photo.png',
                                            duracao: '2h 2m',
                                            recomendacoes: [
                                              'assets/img/banners/joker.sugg/sugg1.png',
                                              'assets/img/banners/joker.sugg/sugg2.png',
                                              'assets/img/banners/joker.sugg/sugg3.png',
                                              'assets/img/banners/joker.sugg/sugg4.png',
                                            ],
                                            filmeId: 'C4GrZ3Ce4zI',
                                          )),
                                );
                              },
                              child: PreviewCard(
                                  'assets/img/banners/joker.jpg'), 
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaFilme(
                                            titulofilme: 'Titanic',
                                            titulo: 'Gosta de viagens à navio?',
                                            descricao:
                                                'Um artista pobre e uma jovem rica se conhecem e se apaixonam na fatídica viagem inaugural do Titanic em 1912. Embora esteja noiva do arrogante herdeiro de uma siderúrgica, a jovem desafia sua família e amigos em busca do verdadeiro amor.',
                                            imagemPoster:
                                                'assets/img/filmephotos/titanic.photo.png',
                                            duracao: '3h 14m',
                                            recomendacoes: [
                                              'assets/img/banners/titanic.sugg/sugg1.png',
                                              'assets/img/banners/titanic.sugg/sugg2.png',
                                              'assets/img/banners/titanic.sugg/sugg3.png',
                                              'assets/img/banners/titanic.sugg/sugg4.png'
                                            ],
                                            filmeId: 'kZlpFIq1Q4k',
                                          )),
                                );
                              },
                              child: PreviewCard(
                                  'assets/img/banners/titanic.jpg'), 
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaFilme(
                                            titulofilme: 'Clube da Luta',
                                            titulo:
                                                'Veja mais alguns clássicos',
                                            descricao:
                                                'Um homem deprimido que sofre de insônia conhece um estranho vendedor chamado Tyler Durden e se vê morando em uma casa suja depois que seu perfeito apartamento é destruído. A dupla forma um clube com regras rígidas onde homens lutam. A parceria perfeita é comprometida quando uma mulher, Marla, atrai a atenção de Tyler.',
                                            imagemPoster:
                                                'assets/img/filmephotos/fightclub.photo.png',
                                            duracao: '2h 19m',
                                            recomendacoes: [
                                              'assets/img/banners/fightclub.sugg/sugg1.png',
                                              'assets/img/banners/fightclub.sugg/sugg2.png',
                                              'assets/img/banners/fightclub.sugg/sugg3.png',
                                              'assets/img/banners/fightclub.sugg/sugg4.png',
                                            ],
                                            filmeId: 'chyRpj-971o',
                                          )),
                                );
                              },
                              child: PreviewCard(
                                  'assets/img/banners/clube.jfif'), 
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0XFF65DC65),
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Baixados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfis',
          ),
        ],
      ),
    );
  }
}

class PreviewCard extends StatelessWidget {
  final String imageUrl;

  PreviewCard(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
