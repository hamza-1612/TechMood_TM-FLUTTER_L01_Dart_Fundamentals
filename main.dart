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
    print('الاسم: $name');
    print('العمر: $age');
    print('التخصص: $major');
    print('الدرجة: $grade');
  }
}

double readGrade() {
  while (true) {
    stdout.write('أدخل الدرجة من 0 إلى 100: ');
    final input = stdin.readLineSync() ?? '';

    try {
      final grade = double.parse(input);

      if (grade < 0 || grade > 100) {
        throw FormatException('الدرجة يجب أن تكون بين 0 و100.');
      }

      return grade;
    } on FormatException catch (error) {
      print('إدخال غير صحيح: ${error.message ?? "أدخل رقمًا صالحًا."}');
    }
  }
}

void main() {
  // تخزين الطلاب في قائمة
  final List<Student> students = [
    Student(name: 'أحمد', age: 20, major: 'علوم الحاسوب', grade: 85),
    Student(name: 'سارة', age: 21, major: 'الهندسة', grade: 72),
    Student(name: 'ليث', age: 19, major: 'الرياضيات', grade: 45),
  ];

  // إدخال طالب جديد
  stdout.write('أدخل اسم الطالب: ');
  final name = stdin.readLineSync() ?? 'غير معروف';

  stdout.write('أدخل عمر الطالب: ');
  final ageInput = stdin.readLineSync() ?? '0';
  final age = int.tryParse(ageInput) ?? 0;

  stdout.write('أدخل تخصص الطالب: ');
  final major = stdin.readLineSync() ?? 'غير محدد';

  final grade = readGrade();

  students.add(
    Student(
      name: name,
      age: age,
      major: major,
      grade: grade,
    ),
  );

  // طباعة بيانات جميع الطلاب وتحديد حالة كل طالب
  print('\nبيانات الطلاب:');
  for (final student in students) {
    print('--------------------');
    student.printInfo();

    if (student.grade >= 50) {
      print('الحالة: ناجح');
    } else {
      print('الحالة: راسب');
    }
  }

  // البحث عن طالب بالاسم
  stdout.write('\nأدخل اسم الطالب الذي تريد البحث عنه: ');
  final searchName = (stdin.readLineSync() ?? '').trim().toLowerCase();

  Student? foundStudent;

  for (final student in students) {
    if (student.name.toLowerCase() == searchName) {
      foundStudent = student;
      break;
    }
  }

  if (foundStudent != null) {
    print('\nتم العثور على الطالب:');
    foundStudent.printInfo();
  } else {
    print('لم يتم العثور على طالب بهذا الاسم.');
  }
}
