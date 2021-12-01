class Content {
  int _id;
  String _judul;
  String _foto;
  String _deskripsi;

  Content(this._judul, this._foto, this._deskripsi);
  Content.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._judul = map['judul'];
    this._foto = map['foto'];
    this._deskripsi = map['deskripsi'];
  }
  int get id => _id;
  String get judul => _judul;
  String get foto => _foto;
  String get deskripsi => _deskripsi;
  set judul(String value) {
    _judul = value;
  }

  set foto(String value) {
    _foto = value;
  }

    set deskripsi(String value) {
    _deskripsi = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['judul'] = judul;
    map['foto'] = foto;
    map['deskripsi'] = deskripsi;
    return map;
  }
}
