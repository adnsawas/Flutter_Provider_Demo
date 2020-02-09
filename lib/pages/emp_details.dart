import 'package:dammam_university_workshop/models/emplpyee.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsPage extends StatelessWidget {
  final Employee emp;

  EmployeeDetailsPage(this.emp);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(title: Text(emp.name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(child: Icon(Icons.person, size: 90,), radius: 60,),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Text("Salary: \$${emp.salary}", style: textStyle, textAlign: TextAlign.center,),
            ),
            Text("Age: ${emp.age}", style: textStyle, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
