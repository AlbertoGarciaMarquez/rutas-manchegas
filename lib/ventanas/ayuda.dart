import "package:flutter/material.dart";

class RutaAyuda extends StatelessWidget {
  static const nombreRuta = "/ayuda";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Ayuda"),
          backgroundColor: Colors.red,
        ),
        body: new Container(
            child: new Center(
          child: new Text("Aqui se mostrará la ayuda"),
        )));
  }
}
