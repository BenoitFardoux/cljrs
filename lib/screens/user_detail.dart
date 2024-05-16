import 'package:flutter/material.dart';

import '../model/mesage.dart';
import '../model/user.dart';


class UserDetail extends StatefulWidget {

  const UserDetail({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserDetailState();
  }
}

class _UserDetailState extends State<UserDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as User;
    final user = args;
    final String nom = user.nom;
    final String prenom = user.prenom;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '$prenom $nom', style: const TextStyle(color: Colors.white)),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nom: $nom'),
            Text('Prénom: $prenom'),
          ],
        ),
      ),
    );
  }

  Widget _buildUserMessage(User user) {
    return ListView.builder(
        itemCount: user.messages.length,
        itemBuilder: (BuildContext context, int index) {
          Message message = user.messages[index];
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/userDetail', arguments: user);
              },
              child: Card(
                  child: Dismissible(
                    key: Key(user.nom),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      user.messages.removeAt(index);
                      setState(() {});
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.message),
                      title: Text(message.sujet),
                      subtitle: Text(message.contenu),
                      trailing: Text(message.date.toString()),

                    ),
                  )));
        });
  }
}
