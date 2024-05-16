import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/auth_provider.dart';
import 'package:flutter_application_5/screens/login_screen.dart';
import 'package:flutter_application_5/screens/register_screen.dart';
import 'package:flutter_application_5/screens/home_screen.dart';
import 'package:flutter_application_5/screens/user_detail.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(),child:  const MainApp()));
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/userDetail': (context) => const UserDetail(),
        '/register': (context) => const RegisterScreen(),
        '/login' : (context) => LoginScreen()
      },
    );
  }
}