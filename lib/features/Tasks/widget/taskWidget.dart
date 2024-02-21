
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../setting_provider.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: ListTile(
        leading:VerticalDivider(
          thickness:4,
          width: 4,
          color: theme.primaryColor,
          indent: 2,
        ),
        title: Text("play basket ball",style:theme.textTheme.bodyMedium!.copyWith(
            color: theme.primaryColor
        )),
        subtitle: Row(
          children: [
            Icon(Icons.access_alarm_rounded,color: vm.current_theme==ThemeMode.light?Colors.black:Colors.white),
            Text("10:30Am",style:vm.current_theme==ThemeMode.light?theme.textTheme.bodySmall!.copyWith(
                color: Colors.black
            ):theme.textTheme.bodySmall)
          ],
        ),
        trailing: Container(
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Icon(Icons.check_rounded,size: 40,color: Colors.white,),
        ),
        contentPadding: EdgeInsets.all(10),
        tileColor: vm.current_theme==ThemeMode.light?Colors.white:Color(0xFF141922),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),

      ),
    );
  }
}
