import 'package:dammam_university_workshop/models/emplpyee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class EmployeesService {
  static String url = "http://dummy.restapiexample.com/api/v1";

  static Future<List<Employee>> fetchEmployees() async {
    var response = await http.get(url + "/employees");
    print(response.statusCode);
    print(response.body);

    List parsedResponse = json.decode(response.body)["data"];
    List<Employee> result = [];
    parsedResponse.forEach((emp) {
      result.add(Employee.fromJson(emp));
    });

    return result;
  }
}