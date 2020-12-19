import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/modelo/modeloGuias.dart';

class PerfilGuia extends StatefulWidget {
  ModeloGuias guia;
  PerfilGuia(this.guia);

  @override
  _PerfilGuiaState createState() => _PerfilGuiaState();
}

class _PerfilGuiaState extends State<PerfilGuia> with TickerProviderStateMixin {
  TextEditingController _nombreController;
  TextEditingController _apellidoController;
  TextEditingController _telefonoController;
  TextEditingController _correoController;
  TextEditingController _precioController;
  TextEditingController _puntuacionController;
  TextEditingController _idiomasController;
  GlobalKey<FormState> _keyform;

  void initState() {
    super.initState();
    _nombreController = new TextEditingController();
    _apellidoController = new TextEditingController();
    _telefonoController = new TextEditingController();
    _correoController = new TextEditingController();
    _precioController = new TextEditingController();
    _puntuacionController = new TextEditingController();
    _idiomasController = new TextEditingController();
    _keyform = new GlobalKey();
    _nombreController.text = widget.guia.nombre;
    _apellidoController.text = widget.guia.apellido;
    _correoController.text = widget.guia.correo;
    _telefonoController.text = widget.guia.telefono.toString();
    _precioController.text = widget.guia.precioHora.toString();
    _puntuacionController.text = widget.guia.puntuacion.toString();
    _idiomasController.text = widget.guia.idiomas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.guia.nombre + " " + widget.guia.apellido),
        backgroundColor: Colors.red,
      ),
      body: new SingleChildScrollView(
          child: new Container(
              margin: new EdgeInsets.all(20.0),
              child: new Form(
                key: _keyform,
                child: formUI(),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          guardar();
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.red,
      ),
    );
  }

  formItemDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: item,
        ),
      ),
    );
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        formItemDesign(
            Icons.person,
            TextFormField(
              controller: _nombreController,
              decoration: new InputDecoration(labelText: "Nombre"),
              validator: validarNombre,
            )),
        formItemDesign(
            Icons.person,
            TextFormField(
              controller: _apellidoController,
              decoration: new InputDecoration(labelText: "Apellido"),
              validator: validarNombre,
            )),
        formItemDesign(
            Icons.phone,
            TextFormField(
              controller: _telefonoController,
              decoration: new InputDecoration(labelText: "Telefono"),
              keyboardType: TextInputType.phone,
              maxLength: 9,
              validator: validarTelefono,
            )),
        formItemDesign(
            Icons.email,
            TextFormField(
              controller: _correoController,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(labelText: "Correo"),
              maxLength: 32,
              validator: validarCorreo,
            )),
        formItemDesign(
            Icons.euro_symbol,
            TextFormField(
              controller: _precioController,
              decoration:
                  new InputDecoration(labelText: "Precio/hora en Euros"),
              validator: validarDouble,
            )),
        formItemDesign(
            Icons.score,
            TextFormField(
              controller: _puntuacionController,
              decoration: new InputDecoration(labelText: "Puntuación"),
              validator: validarDouble,
            )),
        formItemDesign(
            Icons.language,
            TextFormField(
              controller: _idiomasController,
              decoration: new InputDecoration(labelText: "Idiomas"),
            )),
      ],
    );
  }

  String validarDouble(String num) {
    String patron = r'(^[-+]?[0-9]*\.?[0-9]*$)';
    RegExp regExp = new RegExp(patron);
    if (num.length == 0) {
      return "Número necesario";
    } else if (!regExp.hasMatch(num)) {
      return "Solo puede contener números";
    }
    return null;
  }

  String validarNombre(String nombre) {
    String patron =
        r'(^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$)';
    RegExp regExp = new RegExp(patron);
    if (nombre.length == 0) {
      return "Nombre necesario";
    } else if (!regExp.hasMatch(nombre)) {
      return "El nombre solo puede contener letras";
    }
    return null;
  }

  String validarTelefono(String telefono) {
    String patron = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patron);
    if (telefono.length == 0) {
      return "Teléfono necesario";
    } else if (telefono.length != 9) {
      return "El numero debe tener 9 digitos";
    } else if (!regExp.hasMatch(telefono)) {
      return "Solo puede contener dígitos";
    }
    return null;
  }

  String validarCorreo(String correo) {
    String patron =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(patron);
    if (correo.length == 0) {
      return "Correo necesario";
    } else if (!regExp.hasMatch(correo)) {
      return "Correo inválido";
    } else {
      return null;
    }
  }

  guardar() {
    if (_keyform.currentState.validate()) {
      widget.guia.nombre = _nombreController.text;
      widget.guia.apellido = _apellidoController.text;
      widget.guia.telefono = int.parse(_telefonoController.text);
      widget.guia.correo = _correoController.text;
      widget.guia.precioHora = double.parse(_precioController.text);
      widget.guia.puntuacion = double.parse(_puntuacionController.text);
      widget.guia.idiomas = _idiomasController.text;
      Navigator.pop(context);
    }
  }
}
