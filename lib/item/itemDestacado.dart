import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';

class ItemDestacado extends StatefulWidget {
  final ModeloCircuito _ruta;
  ItemDestacado(this._ruta);
  @override
  _ItemDestacadoState createState() => new _ItemDestacadoState();
}

class _ItemDestacadoState extends State<ItemDestacado> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new ListTile(
        onTap: () {
          setState(() {
            if (widget._ruta.destacado == true) {
              widget._ruta.destacado = false;
            } else {
              widget._ruta.destacado = true;
            }
          });
        },
        leading: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(60.0)),
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget._ruta.imagenRuta))),
        ),
        title: Text(
          widget._ruta.nombre,
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        trailing: Icon(
          widget._ruta.destacado ? Icons.star : Icons.star_border,
          color: widget._ruta.destacado ? Colors.yellow : null,
        ),
      ),
      new Divider(
        height: 18.0,
      )
    ]);
  }

  ModeloCircuito get ruta => widget._ruta;
}
