import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:proyecto_ipo_2/modelo/modeloPromocion.dart';

class DetallesPromo extends StatefulWidget {
  ModeloPromocion promo;
  DetallesPromo(this.promo);

  @override
  _DetallesPromoState createState() => _DetallesPromoState();
}

class _DetallesPromoState extends State<DetallesPromo>
    with AutomaticKeepAliveClientMixin<DetallesPromo> {
  Map<String, bool> values = {
    'Rosa Jimenez': false,
    'Carlos Montero': false,
    'Federico Sanchez': false,
  };
  TextEditingController _tituloController;
  TextEditingController _descripcionController;
  GlobalKey<FormState> _keyform;

  void initState() {
    super.initState();
    _tituloController = new TextEditingController();
    _descripcionController = new TextEditingController();
    _keyform = new GlobalKey();
    _tituloController.text = widget.promo.titulo;
    _descripcionController.text = widget.promo.descripcion;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.promo.titulo),
        backgroundColor: Colors.red,
      ),
      body: new Column(
        children: <Widget>[
          new Container(
              margin: new EdgeInsets.all(20.0),
              child: new Form(
                key: _keyform,
                child: formUI(context),
              )),
          Expanded(
            child: new ListView(
              children: values.keys.map((String key) {
                return new CheckboxListTile(
                    title: new Text(key),
                    value: values[key],
                    onChanged: (bool value) {
                      setState(() {
                        values[key] = value;
                      });
                    });
              }).toList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          enviar(context);
        },
        child: Icon(Icons.send),
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
        formItemDesign(
            Icons.title,
            TextFormField(
              controller: _tituloController,
              decoration: new InputDecoration(labelText: "Titulo"),
              validator: validarTitulo,
              maxLength: 30,
            )),
        formItemDesign(
            Icons.description,
            TextFormField(
              controller: _descripcionController,
              maxLines: 3,
              decoration: new InputDecoration(
                labelText: "Descripción",
              ),
            )),
        InkWell(
          onTap: () {
            _selFecha(context);
          },
          child: InputDecorator(
            decoration: InputDecoration(
                labelText: "Fecha de la promoción", enabled: true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  widget.promo.fechaini.toString().substring(0, 10) +
                      " hasta " +
                      widget.promo.fechafin.toString().substring(0, 10),
                ),
                Icon(
                  Icons.date_range,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text("Lista de turistas registrados")
      ],
    );
  }

  Future<void> _selFecha(BuildContext context) async {
    final List<DateTime> fecha = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: widget.promo.fechaini,
        initialLastDate: widget.promo.fechafin,
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025));
    if (fecha != null && fecha.length == 2) {
      setState(() {
        widget.promo.fechaini = fecha[0];
        widget.promo.fechafin = fecha[1];
      });
    }
  }

  String validarTitulo(String nombre) {
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

  enviar(BuildContext context) async {
    if (_keyform.currentState.validate()) {
      widget.promo.titulo = _tituloController.text;
      widget.promo.descripcion = _descripcionController.text;
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content:
                  Text("Promoción enviada a todos los turistas seleccionados"),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      Navigator.pop(context);
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
