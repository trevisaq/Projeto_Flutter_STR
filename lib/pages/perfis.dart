import 'package:ecofilms/pages/home.dart'; // Importa o arquivo 'home.dart' da pasta 'pages', onde provavelmente está definida a tela de destino.
import 'package:flutter/material.dart'; // Importa a biblioteca Flutter Material, que fornece widgets e temas padrão para Android e iOS.

class Perfis extends StatelessWidget { // Define um widget de tela chamada 'Perfis' que é imutável (Stateless).
  const Perfis({super.key}); // Construtor constante para a classe 'Perfis'.

  @override
  Widget build(BuildContext context) { // Método que constrói a interface de usuário.
    return Scaffold( // Cria a estrutura básica da tela.
      appBar: AppBar( // Define a barra de navegação no topo da tela.
        backgroundColor: Color.fromARGB(255, 19, 19, 19), // Define a cor de fundo do AppBar.
        flexibleSpace: Center( // Permite posicionar widgets no centro da barra.
          child: Image.asset( // Adiciona uma imagem centralizada na AppBar.
            'assets/img/components/comp5.png', // Caminho da imagem nos assets.
            width: 190, // Largura da imagem.
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 27, 27, 27), // Define a cor de fundo da tela.
      body: Center( // Centraliza o conteúdo no corpo da tela.
        child: Column( // Coloca os widgets em uma coluna.
          mainAxisAlignment: MainAxisAlignment.center, // Alinha o conteúdo no centro verticalmente.
          children: [
            Text( // Primeiro texto da coluna.
              'Quem está assistindo?', // Conteúdo do texto.
              style: TextStyle( // Define o estilo do texto.
                color: Color.fromARGB(255, 255, 255, 255), // Cor do texto (branco).
                fontFamily: 'Antonio', // Fonte do texto.
                fontSize: 35, // Tamanho da fonte.
              ),
            ),
            Text( // Segundo texto da coluna.
              '“Não deixe para amanhã o filme que você pode ver hoje”', // Conteúdo do texto.
              style: TextStyle( // Define o estilo do texto.
                color: Color.fromARGB(80, 255, 255, 255), // Cor do texto com baixa opacidade.
                fontFamily: 'Antonio', // Fonte do texto.
                fontSize: 13, // Tamanho da fonte.
              ),
            ),
            Container( // Container para o GridView.
              padding: EdgeInsets.all(25), // Define o padding interno.
              child: GridView.count( // Cria uma grade com um número fixo de colunas.
                shrinkWrap: true, // Ajusta o GridView ao conteúdo para evitar overflow.
                crossAxisCount: 2, // Define o número de colunas na grade.
                crossAxisSpacing: 1, // Espaçamento horizontal entre itens.
                mainAxisSpacing: 1, // Espaçamento vertical entre itens.
                children: [
                  Image.asset('assets/img/profiles/django.icon.png'), // Primeira imagem do grid.
                  AnimatedImage( // Segunda imagem do grid, que inclui animação e navegação.
                    imagePath: 'assets/img/profiles/miles.png', // Caminho da imagem.
                    onTap: () { // Função chamada ao tocar na imagem.
                      Navigator.push( // Navega para outra tela.
                        context, // Contexto da navegação.
                        MaterialPageRoute(builder: (context) => Home()), // Rota para a tela 'Home'.
                      );
                    },
                  ),
                  Image.asset('assets/img/profiles/gwen.icon.png'), // Terceira imagem do grid.
                  Image.asset('assets/img/profiles/jane.icon.png'), // Quarta imagem do grid.
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget { // Define um widget de imagem que pode ser animado.
  final String imagePath; // Caminho da imagem a ser exibida.
  final VoidCallback onTap; // Função a ser chamada ao tocar na imagem.

  const AnimatedImage({ // Construtor do widget, recebe o caminho da imagem e a função de clique.
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState(); // Cria o estado do widget.
}

class _AnimatedImageState extends State<AnimatedImage> { // Estado do widget, onde a animação é controlada.
  double scale = 1.0; // Variável para controlar a escala da imagem (inicialmente sem aumento).

  void _onTap() { // Função chamada quando a imagem é tocada.
    setState(() {
      scale = 1.2; // Aumenta levemente a escala para a animação de zoom.
    });

    Future.delayed(Duration(milliseconds: 500), () { // Espera 500ms para a animação ocorrer.
      setState(() {
        scale = 1.0; // Retorna a escala ao normal.
      });
      widget.onTap(); // Chama a função de clique/navegação passada para o widget.
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Detecta toques no widget.
      onTap: _onTap, // Chama a função _onTap quando tocado.
      child: AnimatedScale( // Anima a escala da imagem com base no valor de 'scale'.
        scale: scale, // Define a escala atual da animação.
        duration: Duration(milliseconds: 100), // Duração da animação de escala.
        child: Image.asset( // Exibe a imagem.
          widget.imagePath, // Usa o caminho da imagem passado no construtor.
          width: 200, // Largura da imagem.
          height: 200, // Altura da imagem.
        ),
      ),
    );
  }
}
