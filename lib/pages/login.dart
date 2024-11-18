import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String? _errorMessage;

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 50, 48, 48).withOpacity(0.7),
                BlendMode.darken,
              ),
              child: Image.asset(
                'assets/img/fundologin.jfif',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Novo Positioned para o ícone e texto no canto superior esquerdo
          Positioned(
            top: 20, // Ajuste para mover para o topo
            left: 20, // Ajuste para mover para a esquerda
            child: Row(
              children: [
                Text(
                  "ECOFILMS",
                  style: TextStyle(
                    fontFamily: 'Antonio',
                    fontSize: 24, // Tamanho menor para o texto
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(width: 8), // Espaçamento entre ícone e texto
                Image.asset(
                  'assets/img/icons/logo.png',
                  height: 50, // Tamanho menor para o ícone
                  width: 50, // Tamanho menor para o ícone
                ),
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Faça seu Login",
                    style: TextStyle(
                      fontFamily: 'Antonio',
                      fontSize: 42,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "entre na sua conta para começar a aproveitar nossos serviços",
                    style: TextStyle(
                      fontFamily: 'Antonio',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Insira seu e-mail",
                            style: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            style: TextStyle(
                                color:
                                    Colors.grey), // Define a cor do texto aqui
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 48, 107, 52),
                                      width: 1.8)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 107, 52),
                                    width: 1.3,
                                  )),
                              filled: true,
                              fillColor: Color.fromARGB(255, 41, 47, 54),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor, insira um email";
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return "Insira um email válido";
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value,
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Insira sua senha",
                            style: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            style: TextStyle(color: Colors.grey),
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 48, 107, 52),
                                      width: 1.8)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 107, 52),
                                    width: 1.3,
                                  )),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 41, 47, 54),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor, insira sua senha";
                              }
                              if (value.length < 6) {
                                return "A senha deve ter pelo menos 6 caracteres";
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value,
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                buttonEnterClick();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontFamily: 'Antonio',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(440, 50),
                                backgroundColor: Color(0xFF65DC65),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (_errorMessage != null)
                                Expanded(
                                  child: Text(
                                    _errorMessage!,
                                    style: TextStyle(color: Colors.red),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/cadastro');
                                    },
                                    child: Text(
                                      'Esqueceu a senha?',
                                      style: TextStyle(
                                        fontFamily: 'Antonio',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 173),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ('/cadastro'));
                                    },
                                    child: Text(
                                      "Cadastrar-se",
                                      style: TextStyle(
                                        fontFamily: 'Antonio',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buttonEnterClick() {
    setState(() {
      _errorMessage = null;
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_isValidEmail(_email) && _isValidPassword(_password)) {
        Navigator.pushNamed(context, '/perfis');
      } else {
        setState(() {
          _errorMessage = "Email ou senha inválidos";
        });
      }
    }
  }

  bool _isValidEmail(String? email) {
    return email != null && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  bool _isValidPassword(String? password) {
    return password != null && password.length >= 6;
  }
}
