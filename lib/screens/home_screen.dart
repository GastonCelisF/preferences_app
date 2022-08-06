import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferencias.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  static String routerName='Home';
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text('isDark Mode: ${Preferences.isDarkmode}'),
          Divider(),
           Text('Genero: ${Preferences.gender} '),
          Divider(),
           Text('Nombre de usuario: ${Preferences.name} '),
          Divider(),
        ],
      )
    );
  }
}