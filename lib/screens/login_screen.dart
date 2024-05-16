import 'package:flutter/material.dart';
import '../widget/login_form.dart';
import '../widget/myscaffold.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      name: 'Login',
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
