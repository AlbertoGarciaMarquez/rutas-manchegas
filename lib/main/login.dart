import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  static const nombreRuta = "/login";
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 40.0),
            Column(
              children: <Widget>[
                Image.asset('imagenes/logo.PNG'),
                SizedBox(height: 16.0),
              ],
            ),
            SizedBox(height: 60.0),
            TextField(
              controller: userController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Usuario',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            RaisedButton(
              elevation: 8.0,
              child: Text('Entrar'),
              onPressed: () {
                _inicioSesion(context);
                userController.clear();
                passController.clear();
              },
            )
          ],
        ),
      ),
    );
  }

  void _inicioSesion(BuildContext context) {
    if (userController.text == "Hugo" && passController.text == "1234") {
      String usuario = userController.text;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(user: usuario),
          ));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("Usuario y/o contraseña erróneos",),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Intentar de nuevo",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
