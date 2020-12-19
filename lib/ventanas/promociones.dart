import "package:flutter/material.dart";
import 'package:proyecto_ipo_2/ventanas/destacados.dart';
import 'listaPromociones.dart';

class RutaPromociones extends StatefulWidget {
  static const nombreRuta = "/promociones";
  _RutaPromocionesState createState() => new _RutaPromocionesState();
}

class _RutaPromocionesState extends State<RutaPromociones>
    with SingleTickerProviderStateMixin {
  TabController _controllerTabs;
  @override
  void initState() {
    super.initState();
    _controllerTabs =
        new TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Gestión de promociones"),
          backgroundColor: Colors.red,
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(
                text: "Lista de promociones",
              ),
              new Tab(
                text: "Circuitos Destacados",
              )
            ],
            controller: _controllerTabs,
          ),
        ),
        body: new TabBarView(
          children: <Widget>[new ListaPromociones(), new Destacados()],
          controller: _controllerTabs,
        ));
  }
}
