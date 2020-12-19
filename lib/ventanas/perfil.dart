import "package:flutter/material.dart";

class RutaPerfil extends StatefulWidget {
  static const nombreRuta = "/perfil";
  @override
  _RutaPerfilState createState() => _RutaPerfilState();
}

class _RutaPerfilState extends State<RutaPerfil> {
  TextEditingController _nombreController;
  TextEditingController _correoController;
  TextEditingController _telefonoController;
  TextEditingController _passController;

  void initState() {
    super.initState();
    _nombreController = new TextEditingController();
    _correoController = new TextEditingController();
    _telefonoController = new TextEditingController();
    _passController = new TextEditingController();
    rellenar();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Perfil"),
          backgroundColor: Colors.red,
        ),
        body: new Column(
          children: <Widget>[
            new Column(children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    width: 100.0,
                    height: 100.0,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(60.0)),
                        color: Colors.transparent,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("imagenes/hugo.png"))),
                  ),
                  new Text(
                    "    Hugo",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  SizedBox(width: 90),
                  new Text("Fecha de último acceso: " +
                      DateTime.now().toString().substring(0, 11))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              new SingleChildScrollView(
                  //Formulario
                  child: new Container(
                margin: new EdgeInsets.all(20.0),
                child: textUI(),
              ))
            ])
          ],
        ));
  }

  Widget textUI() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: TextField(
                controller: _nombreController,
                decoration: new InputDecoration(labelText: "Nombre"),
                enabled: false,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.email),
              title: TextField(
                controller: _correoController,
                enabled: false,
                decoration: new InputDecoration(labelText: "Correo"),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: TextField(
                controller: _telefonoController,
                enabled: false,
                decoration: new InputDecoration(labelText: "Teléfono"),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.enhanced_encryption),
              title: TextField(
                controller: _passController,
                enabled: false,
                decoration: new InputDecoration(labelText: "Contraseña"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void rellenar() {
    _nombreController.text = "Hugo García Toledano";
    _correoController.text = "HGT@ipo2.com";
    _telefonoController.text = "615431188";
    _passController.text = "1234";
  }
}
