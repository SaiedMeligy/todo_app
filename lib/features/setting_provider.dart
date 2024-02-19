import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/Setting/page/setting_view.dart';
import 'package:todo_app/features/Tasks/page/task_view.dart';
import 'package:todo_app/features/layout_view.dart';

class SettingProvider extends ChangeNotifier{
  ThemeMode current_theme=ThemeMode.light;
  int current_index=0;
  List<Widget>Screens=[
    TaskView(),
    SettingView(),
  ];
  changeTheme(ThemeMode newTheme){
    if(current_theme==newTheme) return;
    current_theme =newTheme;
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