import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:log_in_firebase/pages/home_ui/home_ui.dart';
import 'package:log_in_firebase/pages/register_ui/register_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegisterPage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        RegisterPage.id: (context) => const RegisterPage(),
      },
    );
  }
}


