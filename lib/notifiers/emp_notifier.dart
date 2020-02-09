import 'package:dammam_university_workshop/models/emplpyee.dart';
import 'package:dammam_university_workshop/services/employees_service.dart';
import 'package:flutter/material.dart';

class EmployeesNotifier extends ChangeNotifier {
  List<Employee> _employees = [
    Employee("Ahmad"),
    Employee("Mohammad"),
    Employee("Ali")
  ];

  EmployeesNotifier() {
    EmployeesService().fetchEmployees().then((data) {
      _employees = data;
      notifyListeners();
    });
  }

  List<Employee> get getEmp => _employees;

  void toggleFav(Employee employee) {
    var empIndex = _employees.indexOf(employee);
    _employees[empIndex].fav = !_employees[empIndex].fav;

    notifyListeners();
  }

  int getLikes() {
    var likes = 0;
    _employees.forEach((emp) {
      if (emp.fav) {
        likes++;
      }
    });

    return likes;
  }
}
