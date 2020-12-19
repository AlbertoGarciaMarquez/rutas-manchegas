import 'package:flutter/material.dart';

import 'package:proyecto_ipo_2/ventanas/perfil.dart';
import 'package:proyecto_ipo_2/ventanas/ayuda.dart';
import 'login.dart';
import 'package:proyecto_ipo_2/ventanas/circuitos.dart';
import 'package:proyecto_ipo_2/ventanas/guias.dart';
import 'package:proyecto_ipo_2/ventanas/historialTurista.dart';
import 'package:proyecto_ipo_2/ventanas/promociones.dart';

class IpoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rutas manchegas',
        home: Login(),
        routes: <String, WidgetBuilder>{
          RutaAyuda.nombreRuta: (BuildContext context) => new RutaAyuda(),
          RutaPerfil.nombreRuta: (BuildContext context) => new RutaPerfil(),
          Login.nombreRuta: (BuildContext context) => new Login(),
          RutaCircuitos.nombreRuta: (BuildContext context) =>
              new RutaCircuitos(),
          RutaGuias.nombreRuta: (BuildContext context) => new RutaGuias(),
          RutaHistorialTurista.nombreRuta: (BuildContext context) =>
              new RutaHistorialTurista(),
          RutaPromociones.nombreRuta: (BuildContext context) =>
              new RutaPromociones()
        });
  }
}
