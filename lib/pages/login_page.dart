import 'package:flutter/material.dart';
import 'package:trivia_checkin/widgets/color_widgets.dart';
import 'package:trivia_checkin/widgets/validador_senha_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
bool _showPassword = false;
ValidarSenha validarSenha = ValidarSenha();
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double telaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: telaHeight * 0.02,
              ),
              Text(
                "Seja, bem-vindo!",
                style: TextStyle(
                  fontSize: 24,
                  color: darkBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: telaHeight * 0.03,
              ),
              TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  // labelText: "E-mail",
                  // labelStyle: const TextStyle(
                  //   color: Colors.black,
                  // ),
                  hintText: 'E-mail', //hintStyle: GoogleFonts.dosis(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Por favor, insira um e-mail.';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(_emailController.text)) {
                    return 'Digite um e-mail correto ';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: telaHeight * 0.01,
              ),
              TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  // labelText: "Senha",
                  // labelStyle: const TextStyle(
                  //   color: Colors.black,
                  // ),
                  hintText: 'Senha', //hintStyle: GoogleFonts.dosis(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                        _showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey),
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                ),
                obscureText: _showPassword == false ? true : false,
                controller: _passwordController,
                keyboardType: TextInputType.text,
                   validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma senha.';
                            }
                            if (!validarSenha.validarSenha(value)) {
                              return 'A senha não atende aos critérios de validação.';
                            }
                            return null;
                          },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                             
                      },
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        softWrap: false,
                      )),
                ],
              ),
              SizedBox(
                height: telaHeight * 0.02,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: yellowColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {} 
                             else{
                              _passwordController.clear();
                             }
                },
                child: const Text(
                  "Entrar",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
