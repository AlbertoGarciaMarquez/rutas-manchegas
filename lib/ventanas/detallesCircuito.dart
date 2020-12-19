import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';
import 'package:proyecto_ipo_2/modelo/modeloGuias.dart';
import 'package:proyecto_ipo_2/ventanas/caminoCircuito.dart';

class DetallesCircuito extends StatefulWidget {
  ModeloCircuito circuito;
  DetallesCircuito(this.circuito);
  List<String> guides = new List<String>();

  @override
  _DetallesCircuitoState createState() => _DetallesCircuitoState();
}

class _DetallesCircuitoState extends State<DetallesCircuito> {
  bool enabled = true;
  TextEditingController _nombreController;
  TextEditingController _costeController;
  TextEditingController _personasController;
  GlobalKey<FormState> _keyform;
  void initState() {
    super.initState();
    _nombreController = new TextEditingController();
    _costeController = new TextEditingController();
    _personasController = new TextEditingController();
    _keyform = new GlobalKey();
    widget.guides = listaGuias();
    _nombreController.text = widget.circuito.nombre;
    _costeController.text = widget.circuito.coste.toString();
    _personasController.text = widget.circuito.numPersonas.toString();
    if (widget.circuito.localizaciones == null) {
      enabled = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.circuito.nombre),
        backgroundColor: Colors.red,
      ),
      body: new SingleChildScrollView(
          child: new Container(
              margin: new EdgeInsets.all(20),
              child: new Form(
                key: _keyform,
                child: formUI(context),
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

  Widget formUI(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.circuito.imagenRuta))),
        ),
        formItemDesign(
            Icons.place,
            TextFormField(
              controller: _nombreController,
              decoration: new InputDecoration(labelText: "Nombre"),
              validator: validarNombre,
            )),
        formItemDesign(
            Icons.euro_symbol,
            TextFormField(
              controller: _costeController,
              decoration: new InputDecoration(labelText: "Coste"),
              validator: validarDouble,
            )),
        formItemDesign(
            Icons.group,
            TextFormField(
              controller: _personasController,
              decoration: new InputDecoration(labelText: "Numero de personas"),
              validator: validarInt,
            )),
        formItemDesign(
            Icons.check,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Finalizada"),
                Checkbox(value: widget.circuito.finalizado, onChanged: null)
              ],
            )),
        InkWell(
          onTap: () {
            _selFecha(context);
          },
          child: InputDecorator(
            decoration:
                InputDecoration(labelText: "Fecha de la ruta", enabled: true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(widget.circuito.fecha.toString().substring(0, 10)),
                Icon(
                  Icons.calendar_today,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text("Guía asignado a la ruta"),
        SizedBox(
          height: 10,
        ),
        DropdownButtonFormField<String>(
            value: widget.circuito.guia,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_add),
              hintText: 'Asignar guía a la ruta',
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (String newValue) {
              setState(() {
                widget.circuito.guia = newValue;
              });
            },
            items: widget.guides.map((String value) {
              return DropdownMenuItem<String>(
                child: Text(value),
                value: value,
              );
            }).toList()),
        SizedBox(height: 20),
        RaisedButton(
            elevation: 8,
            child: Text("Ver itinerario de la ruta"),
            onPressed: enabled ? () => abrirItinerario() : null)
      ],
    );
  }

  List<String> listaGuias() {
    List<String> n = new List<String>();
    for (int i = 0; i < guias.length; i++) {
      String nombre = guias[i].nombre;
      n.add(nombre);
    }
    return n;
  }

  void abrirItinerario() {
    Route ruta = new MaterialPageRoute(
        builder: (context) => new CaminoCircuito(widget.circuito));
    Navigator.push(context, ruta);
  }

  Future<void> _selFecha(BuildContext context) async {
    final DateTime fecha = await showDatePicker(
        context: context,
        initialDate: widget.circuito.fecha,
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2022));
    if (fecha != null && widget.circuito.fecha.isBefore(fecha)) {
      setState(() {
        widget.circuito.fecha = fecha;
      });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "La fecha introducido es anterior a la fecha actual",
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
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

  String validarInt(String num) {
    String patron = r'(^[0-9]+$)';
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

  void guardar() {
    if (_keyform.currentState.validate()) {
      widget.circuito.nombre = _nombreController.text;
      widget.circuito.numPersonas = int.parse(_personasController.text);
      widget.circuito.coste = double.parse(_costeController.text);

      Navigator.pop(context);
    }
  }
}
