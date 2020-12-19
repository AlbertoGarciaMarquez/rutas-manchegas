import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/modelo/modeloPromocion.dart';
import 'package:proyecto_ipo_2/ventanas/detallesPromo.dart';

class ItemPromociones extends StatelessWidget {
  final ModeloPromocion _promo;

  ItemPromociones(this._promo);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new ListTile(
        onTap: () {
          Route ruta = new MaterialPageRoute(
              builder: (context) => new DetallesPromo(_promo));
          Navigator.push(context, ruta);
        },
        title: new Row(
          children: <Widget>[
            new Text(
              _promo.titulo,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            new Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("imagenes/flecha.png"))),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        subtitle: new Container(
          child: new Text(
              "Fecha de la promoción: " +
                  _promo.fechaini.toString().substring(0, 10) +
                  " / " +
                  _promo.fechafin.toString().substring(0, 10),
              style: new TextStyle(fontSize: 15.0)),
          padding: const EdgeInsets.only(top: 5.0),
        ),
      ),
      new Divider(
        height: 18.0,
      )
    ]);
  }

  ModeloPromocion get promo => _promo;
}
