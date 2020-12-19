import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/item/itemHistorial.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';

class Pendientes extends StatefulWidget {
  @override
  _PendientesState createState() => _PendientesState();
  final List<ModeloCircuito> rutas;
  Pendientes({Key key, @required this.rutas}) : super(key: key);
}

class _PendientesState extends State<Pendientes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ModeloCircuito> lPendientes = new List<ModeloCircuito>();
    lPendientes = pendientes(lPendientes);
    return new ListView.builder(
      itemCount: lPendientes.length,
      itemBuilder: (context, int item) => new ItemHistorial(lPendientes[item]),
    );
  }

  List<ModeloCircuito> pendientes(List<ModeloCircuito> pen) {
    for (int i = 0; i < widget.rutas.length; i++) {
      if (widget.rutas[i].finalizado == false) {
        pen.add(widget.rutas[i]);
      }
    }
    return pen;
  }
}
