import '../model/mesage.dart';
import '../model/user.dart';

class MessageController{
  List<Message> messages = [];
  Future<void> loadMessage(List<User> users) async {
    int i = 0;
    for (User element in users) {
      messages.add(Message('Sujet${i+1}', 'Contenu${i+1}', DateTime.now(), element));
      i++;

    }
  }
  void sendMessage(String _subject, String _content, DateTime _date, User _user){
    Message message = Message(_subject, _content, _date, _user);
    messages.add(message);
  }
}