import 'mesage.dart';

class User {
  String _nom;
  String _prenom;
  final List<Message> _messages = [];

  User(this._nom, this._prenom);
  List<Message> get messages => _messages;
  String get nom => _nom;
  String get prenom => _prenom;
  void addMessage(Message message) {
    _messages.add(message);
  }
  set nom(String value) {
    if (value.isNotEmpty) {
      _nom = value;
    }
  }
  set prenom(String value) {
    if (value.isNotEmpty) {
      _prenom = value;
    }
  }
}
