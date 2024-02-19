
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  static const String route_name="SettingView";
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Setting view"),
      ),
    );
  }
}
