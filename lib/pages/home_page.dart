import 'package:dammam_university_workshop/notifiers/emp_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Consumer<EmployeesNotifier>(
        builder: (context, emps, child) {
          return Text("Number of liked employees: ${emps.getLikes()}",
          style: TextStyle(fontSize: 40), textAlign: TextAlign.center,);
        }
      )
      )
    );
  }
}