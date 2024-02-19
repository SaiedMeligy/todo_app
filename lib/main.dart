import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/constants/App_theme_manager.dart';
import 'package:todo_app/features/Setting/page/setting_view.dart';
import 'package:todo_app/features/Tasks/page/task_view.dart';
import 'package:todo_app/features/layout_view.dart';
import 'package:todo_app/features/setting_provider.dart';
import 'package:todo_app/features/splash/page/splash_view.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create:(context) => SettingProvider(),
      child: const todoapp()));
}

class todoapp extends StatelessWidget {
  const todoapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var vm =Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      themeMode: vm.current_theme,
      initialRoute: SplashView.route_name,
      routes: {
        SplashView.route_name :(context) => const SplashView(),
        LayoutView.route_name:(context) =>  LayoutView(),
        TaskView.route_name:(context) => const TaskView(),
        SettingView.route_name:(context) => const SettingView(),

      },


    );
  }
}