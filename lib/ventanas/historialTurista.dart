import "package:flutter/material.dart";
import 'package:proyecto_ipo_2/item/itemTurista.dart';
import 'package:proyecto_ipo_2/modelo/modeloTurista.dart';

class RutaHistorialTurista extends StatefulWidget {
  static const nombreRuta = "/historial";
  @override
  _RutaHistorialTuristaState createState() => new _RutaHistorialTuristaState();
}

class _RutaHistorialTuristaState extends State<RutaHistorialTurista> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Turistas registrados"),
          backgroundColor: Colors.red,
        ),
        body: new ListView.builder(
          itemCount: turistas.length,
          itemBuilder: (context, int item) => new ItemTurista(turistas[item]),
        ));
  }
}
