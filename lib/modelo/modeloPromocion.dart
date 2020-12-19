import 'package:proyecto_ipo_2/modelo/modeloTurista.dart';

class ModeloPromocion {
  String _titulo;
  String _descripcion;
  DateTime _fechaini;
  DateTime _fechafin;

  ModeloPromocion(
      {String titulo,
      String descripcion,
      DateTime fechaini,
      DateTime fechafin,
      List<ModeloTurista> turistas}) {
    this._titulo = titulo;
    this._descripcion = descripcion;
    this._fechaini = fechaini;
    this._fechafin = fechafin;
  }

  String get titulo => _titulo;
  String get descripcion => _descripcion;
  DateTime get fechaini => _fechaini;
  DateTime get fechafin => _fechafin;

  set titulo(String titulo) => _titulo = titulo;
  set descripcion(String descripcion) => _descripcion = descripcion;
  set fechaini(DateTime fechaini) => _fechaini = fechaini;
  set fechafin(DateTime fechafin) => _fechafin = fechafin;
}

List<ModeloPromocion> promociones = <ModeloPromocion>[
  ModeloPromocion(
    titulo: "Oferta en pareja",
    descripcion:
        "Si contratas un circuito con tu pareja recibireis un 20% de descuento para ambos.",
    fechaini: DateTime(2020, 7, 1),
    fechafin: DateTime(2020, 7, 10),
  ),
  ModeloPromocion(
    titulo: "Oferta en Andalucia",
    descripcion:
        "Si contratas un circuito en Andalucia durante Agosto recibirás un 25% de descuento.",
    fechaini: DateTime(2020, 8, 1),
    fechafin: DateTime(2020, 8, 31),
  ),
  ModeloPromocion(
      titulo: "Oferta San Valentín",
      descripcion:
          "El plan perfecto para tu San Valentín, un 50% en cualquier circuito.",
      fechaini: DateTime(2021, 2, 1),
      fechafin: DateTime(2021, 2, 13))
];
