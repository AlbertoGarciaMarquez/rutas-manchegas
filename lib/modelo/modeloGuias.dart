import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';

class ModeloGuias {
  String _nombre;
  String _apellido;
  int _telefono;
  String _correo;
  double _precioHora;
  double _puntuacion;
  String _idiomas;
  String _foto;
  List<ModeloCircuito> _rutas;

  ModeloGuias(
      {String nombre,
      String apellido,
      int telefono,
      String correo,
      double precioHora,
      double puntuacion,
      String idiomas,
      String foto,
      List<ModeloCircuito> rutas}) {
    this._nombre = nombre;
    this._apellido = apellido;
    this._telefono = telefono;
    this._correo = correo;
    this._precioHora = precioHora;
    this._puntuacion = puntuacion;
    this._idiomas = idiomas;
    this._foto = foto;
    this._rutas = rutas;
  }

  ModeloGuias.nuevo(String nombre, String apellido, String foto, String correo,
      double precioHora, double puntuacion) {
    this._nombre = nombre;
    this._apellido = apellido;
    this._foto = foto;
    this._correo = correo;
    this._precioHora = precioHora;
    this._puntuacion = puntuacion;
  }

  String get nombre => _nombre;
  String get apellido => _apellido;
  int get telefono => _telefono;
  String get correo => _correo;
  double get precioHora => _precioHora;
  double get puntuacion => _puntuacion;
  String get idiomas => _idiomas;
  String get foto => _foto;
  List<ModeloCircuito> get rutas => _rutas;

  set nombre(String nombre) => _nombre = nombre;
  set apellido(String apellido) => _apellido = apellido;
  set telefono(int telefono) => _telefono = telefono;
  set correo(String correo) => _correo = correo;
  set precioHora(double precioHora) => _precioHora = precioHora;
  set puntuacion(double puntuacion) => _puntuacion = puntuacion;
  set idiomas(String idiomas) => _idiomas = idiomas;
  set rutas(List<ModeloCircuito> rutas) => _rutas = rutas;
}

List<ModeloGuias> guias = <ModeloGuias>[
  ModeloGuias(
      nombre: "Ernesto",
      apellido: "Ramirez",
      telefono: 615541287,
      correo: "ERamirez@gmail.com",
      precioHora: 9.0,
      puntuacion: 7.5,
      idiomas: "Español/Inglés",
      foto: "imagenes/Ernesto.jpeg"),
  ModeloGuias(
      nombre: "Pilar",
      apellido: "Flores",
      telefono: 615533587,
      correo: "PSuarez@gmail.com",
      precioHora: 12.0,
      puntuacion: 9.5,
      idiomas: "Español/Inglés/Francés",
      foto: "imagenes/Pilar.jpeg"),
  ModeloGuias(
      nombre: "Lola",
      apellido: "Martínez",
      telefono: 600533587,
      correo: "LMartinez@gmail.com",
      precioHora: 15.0,
      puntuacion: 8.5,
      idiomas: "Español",
      foto: "imagenes/Lola.jpeg")
];
