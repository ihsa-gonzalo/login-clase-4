import 'package:flutter/material.dart';
import 'package:flutter_login/model/user_model.dart';
import 'package:flutter_login/ui/screens/create_screen.dart';
import 'package:flutter_login/ui/screens/home_screen.dart';
import 'package:flutter_login/ui/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      initialRoute: 'home',
      routes: {
        'login': (_) => const LoginScreen(),
        'create': (_) => const CreateScreen(),
        'home': (_) => HomeScreen(
              user_model("gonzalo", "123",name: "gonzalo benoffi",phone: "123"),
            ),
      },
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}
