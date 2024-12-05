import 'package:ecofilms/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        _showSnackBar('As senhas não coincidem.', Colors.red);
        return;
      }

      try {
        // Tenta criar o usuário com e-mail e senha
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          // Atualiza o nome do usuário
          await userCredential.user!
              .updateDisplayName(_usernameController.text.trim());
          await userCredential.user!.reload();
        }

        // Exibe mensagem de sucesso e redireciona
        _showSnackBar('Cadastro realizado com sucesso!', Colors.green);
        Navigator.pushReplacementNamed(context, '/login');
      } catch (e) {
        String errorMessage;
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'email-already-in-use':
              errorMessage = 'O e-mail já está em uso.';
              break;
            case 'invalid-email':
              errorMessage = 'Formato de e-mail inválido.';
              break;
            case 'weak-password':
              errorMessage = 'A senha é muito fraca.';
              break;
            default:
              errorMessage = 'Erro desconhecido: ${e.message}';
          }
        } else {
          errorMessage = 'Erro no cadastro: $e';
        }
        _showSnackBar(errorMessage, Colors.red);
      }
    }
  }

  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo com imagem e filtro
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
          // Logo no canto superior esquerdo
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
                  'assets/img/icons/logo.png',
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Faça seu cadastro!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Antonio',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: "Nome de usuário",
                          labelStyle: TextStyle(color: Color.fromARGB(205, 202, 202, 202)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 48, 107, 52),
                                width: 1.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 48, 107, 52),
                                width: 1.3),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 41, 47, 54),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira um nome de usuário';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Color.fromARGB(205, 202, 202, 202)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 48, 107, 52),
                              width: 1.8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 48, 107, 52),
                              width: 1.3),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 41, 47, 54),
                      ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira um e-mail válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Color.fromARGB(205, 202, 202, 202)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 48, 107, 52),
                              width: 1.8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 48, 107, 52),
                              width: 1.3),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 41, 47, 54),
                      ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira uma senha';
                          }
                          if (value.length < 6) {
                            return 'A senha deve ter pelo menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                        labelText: "Confirmar senha",
                        labelStyle: TextStyle(color: Color.fromARGB(205, 202, 202, 202)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 48, 107, 52),
                              width: 1.8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 48, 107, 52),
                              width: 1.3),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 41, 47, 54),
                      ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, confirme sua senha';
                          }
                          if (value != _passwordController.text) {
                            return 'As senhas não coincidem';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      InkWell(
                        onTap: _register,
                        child: Image.asset(
                          'assets/img/components/cadastro.button.png',
                          height: 50,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Já possui uma conta?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
