import 'package:flutter_application_5/model/user.dart';

class Message {
  String _sujet;
  String _contenu;
  DateTime _date;
  User _expediteur;

  Message(this._sujet, this._contenu, this._date, this._expediteur);

  String get sujet => _sujet;

  String get contenu => _contenu;

  DateTime get date => _date;

  User get expediteur => _expediteur;

  set sujet(String value) {
    if (value.isNotEmpty) {
      _sujet = value;
    }
  }

  set contenu(String value) {
    if (value.isNotEmpty) {
      _contenu = value;
    }
  }

  set date(DateTime value) {
    _date = value;
  }

  set expediteur(User value) {
    if (value != null) {
      _expediteur = value;
    }
  }
}
