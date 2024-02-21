import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/Tasks/widget/taskWidget.dart';
import 'package:todo_app/features/setting_provider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

import '../../translation/locale_keys.g.dart';

class TaskView extends StatefulWidget {
  static const String route_name = "TaskView";
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  DateTime focusTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child:
        Stack(alignment: Alignment(0, 2.7), children: [
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.22,
            decoration: BoxDecoration(color: theme.primaryColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Text(LocaleKeys.ToDoList.tr(),
                  style: vm.current_theme == ThemeMode.light
                      ? theme.textTheme.titleLarge
                      : theme.textTheme.titleLarge!
                          .copyWith(color: Color(0xFF141922))),
            ),
          ),
          EasyInfiniteDateTimeLine(
            showTimelineHeader: false,
            timeLineProps: EasyTimeLineProps(
              separatorPadding: 20,
            ),
            dayProps: EasyDayProps(
              inactiveDayStyle: DayStyle(
                dayStrStyle: TextStyle(
                    fontSize: 15,
                    color: vm.current_theme == ThemeMode.light
                        ? Colors.black38
                        : Colors.white70),
                monthStrStyle: TextStyle(
                    fontSize: 15,
                    color: vm.current_theme == ThemeMode.light
                        ? Colors.black38
                        : Colors.white70),
                dayNumStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: vm.current_theme == ThemeMode.light
                        ? Colors.black
                        : Colors.white),
                decoration: BoxDecoration(
                    color: vm.current_theme == ThemeMode.light
                        ? Colors.white
                        : Color(0xFF141922),
                    borderRadius: BorderRadius.circular(10)),
              ),
              todayStyle: DayStyle(
                  decoration: BoxDecoration(
                      color: vm.current_theme == ThemeMode.light
                          ? Colors.white
                          : Color(0xFF141922),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: vm.current_theme == ThemeMode.light
                              ? Colors.black54
                              : Colors.white,
                          width: 2)),
                  dayNumStyle: TextStyle(
                      color: vm.current_theme == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 20)),
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                    color: vm.current_theme == ThemeMode.light
                        ? Colors.white
                        : Color(0xFF141922),
                    borderRadius: BorderRadius.circular(10)),
                dayNumStyle: theme.textTheme.titleLarge!.copyWith(
                    color: vm.current_theme == ThemeMode.light
                        ? theme.primaryColor
                        : theme.primaryColor,
                    fontSize: 25),
                monthStrStyle: theme.textTheme.bodySmall!.copyWith(
                  color: vm.current_theme == ThemeMode.light
                      ? theme.primaryColor
                      : theme.primaryColor,
                ),
                dayStrStyle: theme.textTheme.bodySmall!.copyWith(
                  color: vm.current_theme == ThemeMode.light
                      ? theme.primaryColor
                      : theme.primaryColor,
                ),
              ),
            ),
            firstDate: DateTime(2023),
            focusDate: focusTime,
            lastDate: DateTime(2025),
            onDateChange: (selectedDate) {
              setState(() {
                focusTime = selectedDate;
              });
            },
          )
        ]
    ),
      ),
    //SizedBox(height: 40),
    Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          TaskWidget(),
          TaskWidget(),
          TaskWidget(),
          TaskWidget(),
          TaskWidget(),
          TaskWidget(),
        ],
      ),
    ),
    ]
    );
  }
}
