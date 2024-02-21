import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/Setting/page/setting_view.dart';
import 'package:todo_app/features/Tasks/page/task_view.dart';
import 'package:todo_app/features/layout_view.dart';

class SettingProvider extends ChangeNotifier{
  ThemeMode current_theme=ThemeMode.dark;
  int current_index=0;
  List<Widget>Screens=[
    TaskView(),
    SettingView(),
  ];
  String current_language="en";
  changeTheme(ThemeMode newTheme){
    if(current_theme==newTheme) return;
    current_theme =newTheme;
    notifyListeners();
  }
  changeLanguage(String newLanguage){
    if(current_language==newLanguage) return;
    current_language=newLanguage;
    notifyListeners();

  }
  changeIndex(index){
    current_index=index;
    notifyListeners();
  }
  bool isDark(){
    return current_theme == ThemeMode.dark;
  }
}