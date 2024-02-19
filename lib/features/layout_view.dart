
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/setting_provider.dart';

class LayoutView extends StatelessWidget {
  static const String route_name="LayoutView";
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm=Provider.of<SettingProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: vm.Screens[vm.current_index],
      bottomNavigationBar: BottomAppBar(
        shape:CircularNotchedRectangle(),
        notchMargin:10 ,
        child: BottomNavigationBar(
          currentIndex: vm.current_index,
          onTap: vm.changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setting",
            )
          ],
        ),
      ),
    );
  }
}
