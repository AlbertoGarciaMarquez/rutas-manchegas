import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/modelo/modeloTurista.dart';
import 'package:proyecto_ipo_2/ventanas/historial.dart';

class ItemTurista extends StatelessWidget {
  final ModeloTurista _turista;

  ItemTurista(this._turista);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new ListTile(
        onTap: () {
          Route ruta = new MaterialPageRoute(
              builder: (context) => new RutaHistorial(
                    rutas: _turista.historial,
                    nombre: _turista.nombre,
                  ));
          Navigator.push(context, ruta);
        },
        leading: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(60.0)),
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(_turista.foto))),
        ),
        title: new Row(
          children: <Widget>[
            new Text(
              _turista.nombre + " " + _turista.apellido,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
            new Container(width: 20,
              height: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("imagenes/next.png"))),
           )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        subtitle: new Container(
          child: new Text(_turista.correo,
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
