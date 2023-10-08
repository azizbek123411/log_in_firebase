import 'package:flutter/material.dart';
import 'package:log_in_firebase/pages/home_ui/home_ui.dart';
import 'package:log_in_firebase/pages/register_ui/register_page.dart';
import 'package:log_in_firebase/services/authentication.dart';
class WidgetTree extends StatefulWidget {
  static const String id='widget tree';
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: Auth().authStateChanges,
        builder:(context,snapshot){
      if(snapshot.hasData){
        return const HomePage();
      } return const RegisterPage();
        });
  }
}
