class Employee {
  String name = "";
  int salary = 0;
  int age = 0;
  bool fav = false;

  Employee(this.name);

  Employee.full({this.name, this.salary, this.age});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee.full(
        name: json["employee_name"],
        salary: int.parse(json["employee_salary"]),
        age: int.parse(json["employee_age"]));
  }
}
