import "package:flutter/material.dart";
import 'package:proyecto_ipo_2/item/itemPromociones.dart';
import 'package:proyecto_ipo_2/ventanas/detallesPromo.dart';
import 'package:proyecto_ipo_2/modelo/modeloPromocion.dart';

class ListaPromociones extends StatefulWidget {
  @override
  _ListaPromocionesState createState() => new _ListaPromocionesState();
}

class _ListaPromocionesState extends State<ListaPromociones> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: promociones.length,
        itemBuilder: (context, int item) {
          return new Dismissible(
            confirmDismiss: (direction) async {
              final bool del = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                          "¿Estás seguro de que quieres eliminar la promoción?"),
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
                              promociones.removeAt(item);
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
            child: new ItemPromociones(promociones[item]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ModeloPromocion nuevo = ModeloPromocion(
                titulo: "Nueva promoción",
                descripcion: "",
                fechaini: DateTime(2020),
                fechafin: DateTime(2021));
            promociones.add(nuevo);
            Route ruta = new MaterialPageRoute(
                builder: (context) => new DetallesPromo(nuevo));
            Navigator.push(context, ruta);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
