import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData currentTheme;

  ThemeProvider({
    required bool isDarkmode
    //  si darkmode esta en true entonces theme data va a ser dark, caso contrario themedata.dark()..
  }): currentTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();


  setLigthmode(){
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkMode(){
    currentTheme = ThemeData.dark();
    notifyListeners();
  }

}