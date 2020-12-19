import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/item/rutasDestacadas.dart';
import 'login.dart';
import 'package:proyecto_ipo_2/item/opciones.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
  final String user;
  HomePage({Key key, @required this.user}) : super(key: key);
}

class _HomePageState extends State<HomePage> {
  ListTile _construirItem(
      BuildContext context, IconData iconData, String texto, String ruta) {
    return ListTile(
        leading: new Icon(iconData),
        title: new Text(texto),
        onTap: () {
          setState(() {
            Navigator.pushNamed(context, ruta);
          });
        });
  }

  ListView _construirListView(BuildContext context) {
    return new ListView(children: <Widget>[
      new DrawerHeader(
          child: ListView(
        padding: EdgeInsets.all(18.0),
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 60.0,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("imagenes/logo.PNG"))),
              ),
              SizedBox(
                width: 20,
              ),
              Text("Bienvenido " + widget.user)
            ],
          ),
        ],
      )),
      _construirItem(context, Icons.person, "Perfil", "/perfil"),
      _construirItem(context, Icons.help, "Ayuda", "/ayuda"),
      new AboutListTile(
        child: new Text("Información"),
        applicationIcon: new Icon(Icons.info),
        icon: new Icon(Icons.info),
        applicationName: "Rutas Manchegas",
        applicationVersion: "v0.7",
        aboutBoxChildren: <Widget>[
          new Text(
              "Desarrollado por Noelia Toledano Campos y Alberto García Márquez")
        ],
      ),
      new ListTile(
        leading: new Icon(Icons.exit_to_app),
        title: Text("Cerrar sesión"),
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text("¿Estás seguro de que quieres cerrar sesión?"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        "No",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text(
                        "Si",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ));
                        });
                      },
                    ),
                  ],
                );
              });
        },
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rutas manchegas"),
          backgroundColor: Colors.red,
        ),
        drawer: new Drawer(child: _construirListView(context)),
        body: new Column(
          children: <Widget>[
            new RutasDestacadas(),
            new Expanded(
                child: new ListView.builder(
                    itemCount: menuHome.length,
                    itemBuilder: (context, int item) =>
                        new ItemOpciones(menuHome[item])))
          ],
        ));
  }
}
