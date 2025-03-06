import 'package:flutter/material.dart';
import 'package:myfirstapp/Constantes.dart' as con;
import 'package:myfirstapp/Principal.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool verTexto = true;
  String? labelToast;

  // Variables para obtener el valor de los textos
  final user = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
            child: Container(
              color: Colors.red,
              width: size.width * 0.8,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(size.width * 0.1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Usuario'),
                    TextFormField(
                      controller: user,
                      decoration: InputDecoration(
                        hintText: 'Escribe tu usuario',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Contraseña'),
                    TextFormField(
                      controller: pass,
                      obscureText: verTexto,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                              verTexto ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              verTexto = !verTexto;
                            });
                          },
                        ),
                        hintText: 'Escribe tu contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Botón de inicio de sesión
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: con.color1,
                        fixedSize: Size(size.width * 0.7, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          print('Usuario: ${user.text}');
                          print('Contraseña: ${pass.text}');

                          if (user.text.isEmpty || pass.text.isEmpty) {
                            labelToast = 'Completa ambos campos';
                          } else if (user.text != con.user) {
                            labelToast = 'Usuario Incorrecto';
                          } else if (pass.text != con.pass) {
                            labelToast = 'Contraseña Incorrecta';
                          } else if (con.user == user.text &&
                              con.pass == pass.text) {
                            labelToast = null;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Principal()),
                            );
                          }
                        });
                      },
                      child: const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    if (labelToast != null)
                      Text(
                        labelToast!,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                  ],
                ),
              ),
            ),
            ),
        );
   }
}