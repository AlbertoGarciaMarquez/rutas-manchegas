import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/item/itemDestacado.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';

class Destacados extends StatefulWidget {
  @override
  _DestacadosState createState() => _DestacadosState();
}

class _DestacadosState extends State<Destacados> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: circuitos.length,
      itemBuilder: (context, int item) => new ItemDestacado(circuitos[item]),
    );
  }
}
