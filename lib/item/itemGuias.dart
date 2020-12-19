import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/modelo/modeloGuias.dart';
import 'package:proyecto_ipo_2/ventanas/perfilGuia.dart';

class ItemGuias extends StatelessWidget {
  final ModeloGuias _guia;

  ItemGuias(this._guia);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new ListTile(
        onTap: () {
          Route ruta = new MaterialPageRoute(
              builder: (context) => new PerfilGuia(_guia));
          Navigator.push(context, ruta);
        },
        leading: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(60.0)),
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(_guia.foto))),
        ),
        title: new Row(
          children: <Widget>[
            new Text(
              _guia.nombre + " " + _guia.apellido,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
            new Text(
              _guia.puntuacion.toString(),
              style: new TextStyle(fontSize: 13.5, color: Colors.grey),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        subtitle: new Container(
          child: new Text(_guia.correo,
              style: new TextStyle(fontSize: 15.0, color: Colors.grey)),
          padding: const EdgeInsets.only(top: 5.0),
        ),
      ),
      new Divider(
        height: 18.0,
      )
    ]);
  }
}
