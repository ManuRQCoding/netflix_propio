import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SafeArea(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Logo-Netflix.png',
                    width: 100,
                  ),
                ],
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    SizedBox(height: 35),
                    _crearInput('Correo electrónico'),
                    SizedBox(
                      height: 15,
                    ),
                    _crearInput('Contraseña'),
                    SizedBox(height: 35),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 2,
                          color: Colors.white38,
                        ),
                      ),
                      child: MaterialButton(
                        highlightColor: Colors.black,
                        splashColor: Colors.black,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'profiles');
                        },
                        minWidth: double.infinity,
                        child: Text(
                          'Iniciar sesión',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text('¿Necesitas ayuda?',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 15,
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    Text('¿Todavía sin netflix? Suscríbete ya.',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearInput(String text) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        cursorColor: Colors.white,
        autofocus: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: text,
          labelStyle:
              TextStyle(color: Colors.white38, fontWeight: FontWeight.bold),
          floatingLabelStyle: TextStyle(
              color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 18),
          hintStyle: TextStyle(color: Colors.white38),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: (valor) {},
      ),
    );
  }
}
