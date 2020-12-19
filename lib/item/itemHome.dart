import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';
import 'package:proyecto_ipo_2/ventanas/detallesCircuito.dart';
 
class ItemHome extends StatefulWidget {
  final ModeloCircuito _ruta;
  ItemHome(this._ruta);
  @override
  _ItemHomeState createState() => new _ItemHomeState();
}
 
class _ItemHomeState extends State<ItemHome> {
  Widget build(BuildContext context) {
    return new Container(
      child: new GestureDetector(
          onTap: () {
            Route ruta = new MaterialPageRoute(
                builder: (context) => new DetallesCircuito(widget._ruta));
            Navigator.push(context, ruta);
          },
          child: Container(
              width: 80.0,
              height: 60.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(60.0)),
                  color: Colors.transparent,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget._ruta.imagenRuta))),
              margin: const EdgeInsets.symmetric(horizontal: 8.0))),
    );
  }
}