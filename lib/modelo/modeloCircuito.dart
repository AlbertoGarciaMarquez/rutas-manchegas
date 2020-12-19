import 'package:proyecto_ipo_2/modelo/modeloGuias.dart';
import 'package:proyecto_ipo_2/modelo/modeloLocalizacion.dart';

class ModeloCircuito {
  String _nombre;
  double _coste;
  String _imagenRuta;
  int _numPersonas;
  bool _finalizado;
  bool _destacado;
  DateTime _fecha;
  String _guia;
  List<ModeloLocalizacion> _localizaciones;

  ModeloCircuito(
      {String nombre,
      double coste,
      String imagenRuta,
      int numPersonas,
      bool finalizado,
      bool destacado,
      DateTime fecha,
      String guia,
      List<ModeloLocalizacion> localizaciones}) {
    this._nombre = nombre;
    this._coste = coste;
    this._imagenRuta = imagenRuta;
    this._numPersonas = numPersonas;
    this._finalizado = finalizado;
    this._destacado = destacado;
    this._fecha = fecha;
    this._guia = guia;
    this._localizaciones = localizaciones;
  }

  String get nombre => _nombre;
  double get coste => _coste;
  String get imagenRuta => _imagenRuta;
  int get numPersonas => _numPersonas;
  bool get finalizado => _finalizado;
  bool get destacado => _destacado;
  DateTime get fecha => _fecha;
  String get guia => _guia;
  List<ModeloLocalizacion> get localizaciones => _localizaciones;

  set nombre(String nombre) => _nombre = nombre;
  set coste(double coste) => _coste = coste;
  set numPersonas(int numPersonas) => _numPersonas = numPersonas;
  set finalizado(bool finalizado) => _finalizado = finalizado;
  set destacado(bool destacado) => _destacado = destacado;
  set fecha(DateTime fecha) => _fecha = fecha;
  set guia(String guia) => _guia = guia;
  set localizaciones(List<ModeloLocalizacion> localizaciones) =>
      _localizaciones = localizaciones;
}

List<ModeloCircuito> circuitos = <ModeloCircuito>[
  ModeloCircuito(
      nombre: "Ruta de los molinos",
      coste: 15,
      imagenRuta: "imagenes/molinos.jpeg",
      numPersonas: 25,
      finalizado: true,
      destacado: true,
      fecha: DateTime(2019, 5, 9, 18),
      guia: guias[0].nombre,
      localizaciones: <ModeloLocalizacion>[
        ModeloLocalizacion(
            sitio: "Fuente el Fresno",
            comentario: "Varios molinos característicos de la Mancha"),
        ModeloLocalizacion(
            sitio: "Frontera de Ciudad Real - Toledo",
            comentario: "Paisajes naturales")
      ]),
  ModeloCircuito(
      nombre: "Ruta de la pasión",
      coste: 20,
      imagenRuta: "imagenes/RutaPasion.jpeg",
      numPersonas: 10,
      finalizado: true,
      destacado: true,
      fecha: DateTime(2020, 1, 29, 12, 30),
      guia: guias[0].nombre,
      localizaciones: <ModeloLocalizacion>[
        ModeloLocalizacion(
            sitio: "Fuente el Fresno",
            comentario: "Varios molinos característicos de la Mancha"),
        ModeloLocalizacion(
            sitio: "Frontera de Ciudad Real - Toledo",
            comentario: "Paisajes naturales"),
        ModeloLocalizacion(
            sitio: "Malagón", comentario: "Preciosas vistas al atardecer")
      ]),
  ModeloCircuito(
      nombre: "Ruta de los quesos",
      coste: 5,
      imagenRuta: "imagenes/RutaQuesos.jpeg",
      numPersonas: 6,
      finalizado: false,
      destacado: true,
      fecha: DateTime(2020, 8, 29, 20, 15),
      guia: guias[1].nombre,
      localizaciones: <ModeloLocalizacion>[
        ModeloLocalizacion(
            sitio: "Bolaños de Calatrava",
            comentario: "Primer premio del mejor queso manchego"),
        ModeloLocalizacion(
            sitio: "Almagro", comentario: "Ciudad de las famosas berenjenas"),
        ModeloLocalizacion(
            sitio: "Valenzuela de Calatrava",
            comentario:
                "Terminamos con una buena cena de la mano del restaurante Manolo")
      ]),
  ModeloCircuito(
      nombre: "Ruta de los enamorados",
      coste: 14,
      imagenRuta: "imagenes/RutaEnamorados.jpeg",
      numPersonas: 10,
      finalizado: true,
      destacado: false,
      fecha: DateTime(2020, 2, 14, 19, 30),
      guia: guias[1].nombre,
      localizaciones: <ModeloLocalizacion>[
        ModeloLocalizacion(
            sitio: "Toledo - Zocodover",
            comentario:
                "Ruta por el casco antiguo con un guía explicando todas sus curiosidades"),
        ModeloLocalizacion(
            sitio: "Toledo - Hotel Fermín Caballero",
            comentario:
                "Finalizamos con un SPA, ya que subir las cuestas de Toledo te suele dejar exhausto")
      ]),
  ModeloCircuito(
      nombre: "Ruta de los campeones",
      coste: 40,
      imagenRuta: "imagenes/RutaCampeones.jpeg",
      numPersonas: 12,
      finalizado: false,
      destacado: true,
      fecha: DateTime(2020, 8, 9, 21, 30),
      guia: guias[2].nombre,
      localizaciones: <ModeloLocalizacion>[
        ModeloLocalizacion(
            sitio: "Talavera de la Reina",
            comentario:
                "Visita esta ciudad que ha sido lugar de nacimiento de campeones como Álvaro Bautista o David Arroyo"),
        ModeloLocalizacion(
            sitio: "Talavera de la Reina - Ronda Sur",
            comentario:
                "Disfruta de un atardecer espectacular con un paseo por la ronda sur de Talavera con sus puentes históricos sobre el rio Tajo y su famosa cerámica"),
        ModeloLocalizacion(
            sitio: "Talavera de la Reina - Raices",
            comentario:
                "Cena de la mano del ganador de MasterChef Carlos Maldonado")
      ])
];
