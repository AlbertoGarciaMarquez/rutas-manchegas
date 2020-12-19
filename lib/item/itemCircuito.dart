import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';
import 'package:proyecto_ipo_2/ventanas/detallesCircuito.dart';

class ItemCircuito extends StatelessWidget {
  final ModeloCircuito _ruta;

  ItemCircuito(this._ruta);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new ListTile(
        onTap: () {
          Route ruta = new MaterialPageRoute(
              builder: (context) => new DetallesCircuito(_ruta));
          Navigator.push(context, ruta);
        },
        leading: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(60.0)),
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(_ruta.imagenRuta))),
        ),
        title: new Row(
          children: <Widget>[
            new Text(
              _ruta.nombre,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            new Text(
              _ruta.coste.toString() + "€",
              style: new TextStyle(fontSize: 13.5),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        subtitle: new Container(
          child: new Text(
              "Fecha de la ruta: " + _ruta.fecha.toString().substring(0, 16),
              style: new TextStyle(fontSize: 15.0)),
          padding: const EdgeInsets.only(top: 5.0),
        ),
      ),
      new Divider(
        height: 18.0,
      )
    ]);
  }

  ModeloCircuito get ruta => _ruta;
}
