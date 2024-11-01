import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String? _errorMessage;

  String? _email;
  String? _password;
  String? _confirmPassword;

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
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              children: [
                Text(
                  "ECOFILMS",
                  style: TextStyle(
                    fontFamily: 'Antonio',
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/img/logo.png',
                  height: 50,
                  width: 50,
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
                    "Cadastre-se",
                    style: TextStyle(
                      fontFamily: 'Antonio',
                      fontSize: 42,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "crie sua conta para aproveitar nossos serviços",
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
                            style: TextStyle(color: Colors.grey),
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
                            "Crie uma senha",
                            style: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 8),
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
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor, crie uma senha";
                              }
                              if (value.length < 6) {
                                return "A senha deve ter pelo menos 6 caracteres";
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value,
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Confirme sua senha",
                            style: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 8),
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
                              filled: true,
                              fillColor: Color.fromARGB(255, 41, 47, 54),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                            validator: (String? value) {
                              if (value != _password) {
                                return "As senhas não coincidem";
                              }
                              return null;
                            },
                            onSaved: (value) => _confirmPassword = value,
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  Navigator.pushNamed(context, '/home');
                                } else {
                                  setState(() {
                                    _errorMessage = "Erro ao cadastrar";
                                  });
                                }
                              },
                              child: Text(
                                "Cadastrar-se",
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
                          if (_errorMessage != null)
                            Center(
                              child: Text(
                                _errorMessage!,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Já tem uma conta? ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontFamily: 'Antonio',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
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
}
