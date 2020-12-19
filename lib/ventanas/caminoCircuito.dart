import 'package:flutter/material.dart';
import 'package:proyecto_ipo_2/modelo/modeloCircuito.dart';
import 'package:proyecto_ipo_2/modelo/modeloLocalizacion.dart';

class CaminoCircuito extends StatefulWidget {
  ModeloCircuito circuito;
  CaminoCircuito(this.circuito);
  List<Step> steps;

  @override
  _CaminoCircuitoState createState() => _CaminoCircuitoState();
}

class _CaminoCircuitoState extends State<CaminoCircuito> {
  var _index = 0;
  void initState() {
    super.initState();
    widget.steps = new List<Step>();
    rellenarSteps();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.circuito.localizaciones == null) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text("Itinerario de la ruta"),
            backgroundColor: Colors.red,
          ),
          body: new Container(
              margin: EdgeInsets.all(20),
              child: new Center(
                child: new Text(
                  "El camino de la ruta no está disponible ya que acaba de ser creada.",
                  textAlign: TextAlign.center,
                ),
              )));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Itinerario de la ruta"),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[_builderStep(), SizedBox(height: 300)],
          ),
        ),
      );
    }
  }

  Widget _builderStep() => Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.red[100],
        child: Stepper(
          steps: widget.steps,
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
              Container(),
        ),
      );

  Step crearStep(ModeloLocalizacion l) {
    return Step(title: Text(l.sitio), content: Text(l.comentario));
  }

  void rellenarSteps() {
    for (int i = 0; i < widget.circuito.localizaciones.length; i++) {
      widget.steps.add(crearStep(widget.circuito.localizaciones[i]));
    }
  }
}
