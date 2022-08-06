import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferencias.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
   
  const SettingsScreen({Key? key}) : super(key: key);
  static String routerName='Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ajustes', style: TextStyle(fontSize: 45,fontWeight: FontWeight.w300),),
              Divider(),
              SwitchListTile.adaptive(
                value:  Preferences.isDarkmode,
                title: const  Text('Dark Mode'),
                onChanged: (value){
                 Preferences.isDarkmode = value;
                 final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
                 //si mi themeprovider es true llama la funcion que cambia el theme en dark sino la que lo cambia a light
                 value ? themeProvider.setDarkMode() : themeProvider.setLigthmode();
                 setState(() {});
                }
                ),
                const Divider(),   
                RadioListTile<int>(
                value: 1,
                groupValue: Preferences.gender,
                title: const Text('Masculino'),
                onChanged: (value){
                  Preferences.gender = value ?? 1;
                  setState(() {});
                }
              ),
              const Divider(),   
                RadioListTile<int>(
                value: 2,
                groupValue: Preferences.gender,
                title: const Text('Femenino'),
                onChanged: (value){
                  Preferences.gender = value ?? 2;
                  setState(() {});
                }
              ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name, 
                    onChanged: (value){
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre del Usuario',
                    ),
                  ),
                ),         
            ],
          ),
          ),
      )
  );
  }
}