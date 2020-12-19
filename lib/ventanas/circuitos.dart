import "package:flutter/material.dart";
import 'package:proyecto_ipo_2/item/itemCircuito.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';
import 'package:proyecto_ipo_2/ventanas/detallesCircuito.dart';

class RutaCircuitos extends StatefulWidget {
  static const nombreRuta = "/circuitos";
  @override
  _RutaCircuitosState createState() => new _RutaCircuitosState();
}

class _RutaCircuitosState extends State<RutaCircuitos> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Gestionar circuitos"),
          backgroundColor: Colors.red,
        ),
        body: new ListView.builder(
          itemCount: circuitos.length,
          itemBuilder: (context, int item) {
            return new Dismissible(
              confirmDismiss: (direction) async {
                final bool del = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "¿Estás seguro de que quieres eliminar el circuito?"),
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
                                circuitos.removeAt(item);
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
              child: new ItemCircuito(circuitos[item]),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              ModeloCircuito nuevo = ModeloCircuito(
                  nombre: "Nuevo Circuito",
                  imagenRuta: "imagenes/circuito.png",
                  finalizado: false,
                  destacado: false,
                  fecha: DateTime(2020));
              circuitos.add(nuevo);
              Route ruta = new MaterialPageRoute(
                  builder: (context) => new DetallesCircuito(nuevo));
              Navigator.push(context, ruta);
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ));
  }
}
