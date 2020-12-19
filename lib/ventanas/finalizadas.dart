import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/item/itemHistorial.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';

class Finalizadas extends StatefulWidget {
  @override
  _FinalizadasState createState() => _FinalizadasState();
  final List<ModeloCircuito> rutas;
  Finalizadas({Key key, @required this.rutas}) : super(key: key);
}

class _FinalizadasState extends State<Finalizadas> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ModeloCircuito> lFinalizadas = new List<ModeloCircuito>();
    lFinalizadas = finalizados(lFinalizadas);
    return new ListView.builder(
      itemCount: lFinalizadas.length,
      itemBuilder: (context, int item) => new ItemHistorial(lFinalizadas[item]),
    );
  }

  List<ModeloCircuito> finalizados(List<ModeloCircuito> fin) {
    for (int i = 0; i < widget.rutas.length; i++) {
      if (widget.rutas[i].finalizado == true) {
        fin.add(circuitos[i]);
      }
    }
    return fin;
  }
}
