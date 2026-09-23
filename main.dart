import 'dart:io';

class Student {
  String name;
  int age;
  String major;
  double grade;

  Student({
    required this.name,
    required this.age,
    required this.major,
    required this.grade,
  });

  void printInfo() {
    print('Name: $name');
    print('Age: $age');
    print('Major: $major');
    print('Grade: $grade');
  }
}

double readGrade() {
  while (true) {
    stdout.write('Enter grade (0-100): ');
    final input = stdin.readLineSync() ?? '';

    try {
      final grade = double.parse(input);

      if (grade < 0 || grade > 100) {
        throw FormatException('The grade must be between 0 and 100.');
      }

      return grade;
    } on FormatException catch (error) {
      print('Invalid input: ${error.message ?? "Please enter a valid number."}');
    }
  }
}

void main() {
  // Store students in a list.
  final List<Student> students = [
    Student(name: 'Ahmed', age: 20, major: 'Computer Science', grade: 85),
    Student(name: 'Sara', age: 21, major: 'Engineering', grade: 72),
    Student(name: 'Laith', age: 19, major: 'Mathematics', grade: 45),
  ];

  // Add a new student.
  stdout.write('Enter student name: ');
  final name = stdin.readLineSync() ?? 'Unknown';

  stdout.write('Enter student age: ');
  final ageInput = stdin.readLineSync() ?? '0';
  final age = int.tryParse(ageInput) ?? 0;

  stdout.write('Enter student major: ');
  final major = stdin.readLineSync() ?? 'Undeclared';

  final grade = readGrade();

  students.add(
    Student(
      name: name,
      age: age,
      major: major,
      grade: grade,
    ),
  );

  // Print all student data and each student's status.
  print('\nStudent list:');
  for (final student in students) {
    print('--------------------');
    student.printInfo();

    if (student.grade >= 50) {
      print('Status: Passed');
    } else {
      print('Status: Failed');
    }
  }

  // Search for a student by name.
  stdout.write('\nEnter the name to search for: ');
  final searchName = (stdin.readLineSync() ?? '').trim().toLowerCase();

  Student? foundStudent;

  for (final student in students) {
    if (student.name.toLowerCase() == searchName) {
      foundStudent = student;
      break;
    }
  }

  if (foundStudent != null) {
    print('\nStudent found:');
    foundStudent.printInfo();
  } else {
    print('No student with that name was found.');
  }
}
