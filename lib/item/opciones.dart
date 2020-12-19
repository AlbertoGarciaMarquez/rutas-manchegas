import 'package:flutter/material.dart';

class Opciones {
  String opcion;
  String icono;
  String ruta;
  String user;

  Opciones({String opcion, String icono, String ruta}) {
    this.opcion = opcion;
    this.icono = icono;
    this.ruta = ruta;
  }
}

List<Opciones> menuHome = <Opciones>[
  Opciones(
      opcion: "Consultar historial de circuitos",
      icono: "imagenes/historial.png",
      ruta: "/historial"),
  Opciones(
      opcion: "Gestionar circuitos",
      icono: "imagenes/circuito.png",
      ruta: "/circuitos"),
  Opciones(
      opcion: "Gestionar guías turísticos",
      icono: "imagenes/guia.png",
      ruta: "/guias"),
  Opciones(
      opcion: "Gestionar promociones",
      icono: "imagenes/promocion.png",
      ruta: "/promociones")
];

class ItemOpciones extends StatelessWidget {
  final Opciones _opcion;

  ItemOpciones(this._opcion);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new SizedBox(
        height: 20.0,
      ),
      new ListTile(
        leading: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(image: AssetImage(_opcion.icono)))),
        title: new Row(
          children: <Widget>[
            new Text(
              _opcion.opcion,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        onTap: () {
          Navigator.pushNamed(context, _opcion.ruta);
        },
      ),
      new Divider(
        height: 40.0,
      )
    ]);
  }
}