class ModeloLocalizacion {
  String _sitio;
  String _comentario;

  ModeloLocalizacion({String sitio, String comentario}) {
    this._sitio = sitio;
    this._comentario = comentario;
  }

  String get sitio => _sitio;
  String get comentario => _comentario;

  set sitio(String sitio) => _sitio = sitio;
  set comentario(String comentario) => _comentario = comentario;
}
