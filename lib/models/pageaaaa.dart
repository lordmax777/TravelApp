class dbmalumotlar{
  String? _raasimlarturlari;
  String? _titellarturlari;
  String? _davlatlarnomi;
  String? _malumotlar;
  String? _hotellar;

  dbmalumotlar( this._raasimlarturlari, this._titellarturlari, this._davlatlarnomi, this._malumotlar, this._hotellar);

  String? get rasimlar => _raasimlarturlari;
  String? get titellar => _titellarturlari;
  String? get davlatlar => _davlatlarnomi;
  String? get malumotlar => _malumotlar;
  String? get hotellar => _hotellar;
}