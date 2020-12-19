import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/item/itemHome.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';

class RutasDestacadas extends StatefulWidget {
  _RutasDestacadasState createState() => _RutasDestacadasState();
}

class _RutasDestacadasState extends State<RutasDestacadas> {
  List<ModeloCircuito> lDestacados = new List<ModeloCircuito>();
  void initState() {
    super.initState();
    lDestacados = destacados(lDestacados);
  }

  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: const EdgeInsets.all(16.0),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "Rutas destacadas",
              ),
              new GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/circuitos");
                  },
                  child: new Row(
                    children: <Widget>[
                      new Icon(Icons.play_arrow),
                      new Text(
                        "Ver todas",
                      )
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          new Expanded(
              child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lDestacados.length,
                  itemBuilder: (context, int item) =>
                      new ItemHome(lDestacados[item])))
        ],
      ),
    );
  }

  List<ModeloCircuito> destacados(List<ModeloCircuito> des) {
    for (int i = 0; i < circuitos.length; i++) {
      if (circuitos[i].destacado == true) {
        des.add(circuitos[i]);
      }
    }
    return des;
  }
}
