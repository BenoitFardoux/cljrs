import 'package:flutter/material.dart';
import 'package:flutter_application_5/controller/user.dart';
import 'package:flutter_application_5/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  final UserController _userController = UserController();

  @override
  void initState() {
    super.initState();
    _userController.loadUsers();
  }

  Widget _buildUserList() {
    return ListView.builder(
        itemCount: _userController.users.length,
        itemBuilder: (BuildContext context, int index) {
          User user = _userController.users[index];
          return Card(
              child: Dismissible(
            key: Key(user.nom),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              _userController.users.removeAt(index);
              setState(() {});
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text('${user.prenom} ${user.nom}'),
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter', style: TextStyle(color: Colors.white)),
        elevation: 10.0,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: _buildUserList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogBuilder(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  late String _nom;
  late String _prenom;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ajouter une personnne'),
            content: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //position
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      onSaved: (String? value) {
                        _prenom = value ?? '';
                      },
                      decoration: const InputDecoration(
                        labelText: 'Prénom',
                      ),
                    ),
                    TextFormField(
                      onSaved: (String? value) {
                        _nom = value ?? '';
                      },
                      decoration: const InputDecoration(
                        labelText: 'Nom',
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ajouter'),
                onPressed: () {
                  _formKey.currentState!.save();
                  _userController.addUser(_nom, _prenom);
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
