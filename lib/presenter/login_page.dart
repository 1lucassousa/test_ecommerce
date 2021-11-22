import 'package:flutter/material.dart';
import 'package:test_ecommerce/presenter/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _ctrlLogin = TextEditingController();
  final _ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/login.jpg'), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 310,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Bem vindo!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 40),
                      child: const Text(
                        "Faça login para continuar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ),
                    _textFormField("Email", controller: _ctrlLogin),
                    _textFormField("Senha",
                        password: true, controller: _ctrlPassword),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        child: const Center(
                          child: Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _textFormField(
    String label, {
    bool password = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: password,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon:
            password ? const Icon(Icons.lock) : const Icon(Icons.email_rounded),
        labelStyle: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
        labelText: label,
      ),
    );
  }
}
