import "package:flutter/material.dart";
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';
import 'finalizadas.dart';
import 'pendientes.dart';

class RutaHistorial extends StatefulWidget {
  @override
  _RutaHistorialState createState() => new _RutaHistorialState();
  final List<ModeloCircuito> rutas;
  final String nombre;
  RutaHistorial({Key key, @required this.rutas, @required this.nombre})
      : super(key: key);
}

class _RutaHistorialState extends State<RutaHistorial>
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
          title: new Text("Historial de rutas de " + widget.nombre),
          backgroundColor: Colors.red,
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(
                text: "Finalizadas",
              ),
              new Tab(
                text: "Pendientes",
              )
            ],
            controller: _controllerTabs,
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Finalizadas(rutas: widget.rutas),
            new Pendientes(rutas: widget.rutas)
          ],
          controller: _controllerTabs,
        ));
  }
}
