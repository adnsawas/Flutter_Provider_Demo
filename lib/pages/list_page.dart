import 'package:dammam_university_workshop/models/emplpyee.dart';
import 'package:dammam_university_workshop/notifiers/emp_notifier.dart';
import 'package:dammam_university_workshop/pages/emp_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeesNotifier>(
      builder: (context, emps, child) {
        List<Employee> _employees = emps.getEmp;
        return ListView.builder(
          itemBuilder: (context, index) {
            Employee emp = _employees[index];
            return ListTile(
              title: Text(emp.name),
              subtitle: Text("\$${emp.salary}"),
              leading: CircleAvatar(
                child: Text(emp.name[0]),
              ),
              trailing: IconButton(
                icon: emp.fav
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border),
                onPressed: () {
                  emps.toggleFav(emp);
                },
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmployeeDetailsPage(emp)));
              },
            );
          },
          itemCount: _employees.length,
        );
      },
    );
  }
}
