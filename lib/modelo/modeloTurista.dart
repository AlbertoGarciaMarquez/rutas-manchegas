import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';

class ModeloTurista {
  String _nombre;
  String _apellido;
  int _telefono;
  int _edad;
  String _correo;
  String _foto;
  List<ModeloCircuito> _historial;

  ModeloTurista(
      {String nombre,
      String apellido,
      int telefono,
      String correo,
      String foto,
      int edad,
      List<ModeloCircuito> historial}) {
    this._nombre = nombre;
    this._apellido = apellido;
    this._telefono = telefono;
    this._correo = correo;
    this._foto = foto;
    this._edad = edad;
    this._historial = historial;
  }

  String get nombre => _nombre;
  String get apellido => _apellido;
  int get telefono => _telefono;
  String get correo => _correo;
  String get foto => _foto;
  int get edad => _edad;
  List<ModeloCircuito> get historial => _historial;

  set nombre(String nombre) => _nombre = nombre;
  set apellido(String apellido) => _apellido = apellido;
  set telefono(int telefono) => _telefono = telefono;
  set correo(String correo) => _correo = correo;
  set edad(int edad) => _edad = edad;
  set historial(List<ModeloCircuito> historial) => _historial = historial;
}

List<ModeloTurista> turistas = <ModeloTurista>[
  ModeloTurista(
      nombre: "Rosa",
      apellido: "Jiménez",
      telefono: 615500287,
      correo: "RJimenez@gmail.com",
      foto: "imagenes/Rosa.jpeg",
      edad: 24,
      historial: circuitos),
  ModeloTurista(
      nombre: "Carlos",
      apellido: "Montero",
      telefono: 615539987,
      correo: "CMontero@gmail.com",
      foto: "imagenes/Carlos.jpeg",
      edad: 32,
      historial: <ModeloCircuito>[circuitos[1], circuitos[2], circuitos[3]]),
  ModeloTurista(
      nombre: "Federico",
      apellido: "Sánchez",
      telefono: 615888987,
      correo: "FSanchez@gmail.com",
      foto: "imagenes/Federico.jpeg",
      edad: 27,
      historial: <ModeloCircuito>[circuitos[3], circuitos[4], circuitos[0]])
];
