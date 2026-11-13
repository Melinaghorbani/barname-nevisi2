import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StudentPage(),
  ));
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final averageController = TextEditingController();
  String result = '';

  void checkStudent() {
    String name = nameController.text.trim();
    int? age = int.tryParse(ageController.text.trim());
    double? average = double.tryParse(averageController.text.trim());

    setState(() {
      if (name.isEmpty || age == null || age <= 0 ||
          average == null || !average.isFinite ||
          average < 0 || average > 20) {
        result = 'نام، سن و معدل معتبر وارد کنید.';
        return;
      }

      String status;
      if (average >= 10) {
        status = 'قبول';
      } else {
        status = 'مردود';
      }

      result = 'نام: $name\nسن: $age\nمعدل: $average\nوضعیت: $status';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    averageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('وضعیت دانش‌آموز')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'نام دانش‌آموز'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'سن',
                  hintText: 'مثلاً 16 با ارقام انگلیسی',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: averageController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'معدل از 20',
                  hintText: 'مثلاً 15.5 با ارقام انگلیسی',
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: checkStudent,
                child: const Text('نمایش وضعیت'),
              ),
              const SizedBox(height: 24),
              Text(result, style: const TextStyle(fontSize: 18, height: 1.8)),
            ],
          ),
        ),
      ),
    );
  }
}
