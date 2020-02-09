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
  int _tabIndex = 0;
  List<Widget> pages = [HomePage(), ListPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(child: pages[_tabIndex], 
        create: (context) => EmployeesNotifier(),
        ),
        appBar: AppBar(
          title: Text("Dammam University Workshop"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("List")),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          }
        ),
      ),
    );
  }
}
