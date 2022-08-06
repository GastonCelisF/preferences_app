

import 'package:shared_preferences/shared_preferences.dart';

// No es un gestor de estado,  el share preferences sirve para almacenar fisicamente en el dispositivos llaves o pares de valor
//llaves, pares de valores, Pero no redibuja el estado.. 
class Preferences{

//creacion e inicializacion de preferencias de usuario
  static late SharedPreferences _prefs;

  static String _name= '';
  static bool _isDarkmode=false;
  static int _gender = 1;


//en todo momento que se llame al init voy a tener los 3 campos..
  static Future init()async{
    _prefs = await SharedPreferences.getInstance();
  }

  // Getters y Setters
  //queremos leerlas sin la necesida de inicializarlas por ende usamos static
  static String get name{
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name){
    _name = name;
    _prefs.setString('name', name);
  }

   static bool get isDarkmode{
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode(bool value){
    _isDarkmode = value;
    _prefs.setBool('isDarkmode', value);
  }

   static int get gender{
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int value){
    _gender = value;
    _prefs.setInt('gender', value);
  }
}