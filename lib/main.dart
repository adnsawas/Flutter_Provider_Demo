import 'package:dammam_university_workshop/notifiers/emp_notifier.dart';
import 'package:dammam_university_workshop/pages/home_page.dart';
import 'package:dammam_university_workshop/pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  return runApp(DammamUniversityApp());
}

class DammamUniversityApp extends StatefulWidget {
  @override
  _DammamUniversityAppState createState() => _DammamUniversityAppState();
}

class _DammamUniversityAppState extends State<DammamUniversityApp> {
  int _tabIndex = 1;
  List<Widget> pages = [HomePage(), ListPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => EmployeesNotifier(),
        child: Scaffold(
          body: pages[_tabIndex],
          appBar: AppBar(
            title: Text("Dammam University Workshop"),
            actions: <Widget>[
              Consumer<EmployeesNotifier>(
                builder: (context, notifier, _) {
                  return IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        notifier.refresh();
                      });
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    title: Consumer<EmployeesNotifier>(
                      builder: (context, emps, child) {
                        return Text("List (${emps.getLikes()})");
                      },
                    )),
              ],
              currentIndex: _tabIndex,
              onTap: (index) {
                setState(() {
                  _tabIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
