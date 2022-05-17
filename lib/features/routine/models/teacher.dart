import 'package:equatable/equatable.dart';

class Teacher extends Equatable {

  final String name;
  final String? employeeId;
  final String designation;
  final String department;
  final String faculty;
  final String? email;
  final String? phone;
  final String? siteURL;
  final String? localImagePath;

  const Teacher({
    required this.name,
    this.employeeId,
    required this.designation,
    required this.department,
    required this.faculty,
    this.email,
    this.phone,
    this.siteURL,
    this.localImagePath,
  });




  Teacher copyWith({
    String? name,
    String? employeeId,
    String? designation,
    String? department,
    String? faculty,
    String? email,
    String? phone,
    String? siteURL,
    String? localImagePath,
  }) {
    return Teacher(
      name: name ?? this.name,
      employeeId: employeeId ?? this.employeeId,
      designation: designation ?? this.designation,
      department: department ?? this.department,
      faculty: faculty ?? this.faculty,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      siteURL: siteURL ?? this.siteURL,
      localImagePath: localImagePath ?? this.localImagePath,
    );
  }

  @override
  String toString() {
    return 'Teacher(name: $name, employeeId: $employeeId, designation: $designation, department: $department, faculty: $faculty, email: $email, phone: $phone, siteURL: $siteURL, localImagePath: $localImagePath)';
  }

  @override
  List<Object?> get props => [
        name,
        employeeId,
        designation,
        department,
        faculty,
        email,
        phone,
        siteURL,
        localImagePath,
      ];
}
