import 'package:ecofilms/pages/home.dart';
import 'package:ecofilms/pages/perfis.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecofilms/pages/cadastro.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Perfis()),
      );
    } catch (e) {
      _showSnackBar('Erro no login: ${e.toString()}', Colors.red);
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        _showSnackBar('Login cancelado pelo usuário', Colors.orange);
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Perfis()),
      );
    } catch (e) {
      _showSnackBar('Erro ao fazer login com Google: ${e.toString()}', Colors.red);
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Faça seu login!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Antonio',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Color.fromARGB(205, 202, 202, 202)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 48, 107, 52),
                            width: 1.8,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 48, 107, 52),
                            width: 1.3,
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 41, 47, 54),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Color.fromARGB(205, 202, 202, 202)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 48, 107, 52),
                            width: 1.8,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 48, 107, 52),
                            width: 1.3,
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 41, 47, 54),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: _login,
                      child: Image.asset(
                        'assets/img/components/login.button.png',
                        height: 50,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CadastroScreen()),
                            );
                          },
                          child: Text(
                            'Não tem uma conta?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: _signInWithGoogle,
                              child: Image.asset(
                                'assets/img/icons/google.button.png',
                                width: 35,
                              ),
                            ),
                            Text(
                              'Conta Google',
                              style: TextStyle(
                                fontFamily: 'Antonio',
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
