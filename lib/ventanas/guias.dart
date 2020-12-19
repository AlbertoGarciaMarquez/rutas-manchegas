import "package:flutter/material.dart";

import 'package:proyecto_ipo_2/modelo/modeloGuias.dart';
import 'package:proyecto_ipo_2/item/itemGuias.dart';
import 'package:proyecto_ipo_2/ventanas/perfilGuia.dart';

class RutaGuias extends StatefulWidget {
  static const nombreRuta = "/guias";
  @override
  _RutaGuiasState createState() => new _RutaGuiasState();
}

class _RutaGuiasState extends State<RutaGuias> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Guias turisticos"),
          backgroundColor: Colors.red,
        ),
        body: new ListView.builder(
          itemCount: guias.length,
          itemBuilder: (context, int item) {
            return new Dismissible(
              confirmDismiss: (direction) async {
                final bool del = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "¿Estás seguro de que quieres eliminar el guía?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text(
                              "Eliminar",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              setState(() {
                                guias.removeAt(item);
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                return del;
              },
              background: Container(color: Colors.red),
              key: UniqueKey(),
              child: new ItemGuias(guias[item]),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              ModeloGuias nuevo = ModeloGuias.nuevo(
                  "Nuevo", "Usuario", "imagenes/guia.png", "", 0, 0);
              guias.insert(guias.length, nuevo);
              Route ruta = new MaterialPageRoute(
                  builder: (context) => new PerfilGuia(nuevo));
              Navigator.push(context, ruta);
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ));
  }
}
