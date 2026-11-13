import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GradesPage(),
  ));
}

class GradesPage extends StatefulWidget {
  const GradesPage({super.key});

  @override
  State<GradesPage> createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  final gradesController = TextEditingController();
  String result = '';

  void calculateGrades() {
    List<String> inputs = gradesController.text.replaceAll('،', ',').split(',');
    List<double> grades = [];

    for (String input in inputs) {
      double? grade = double.tryParse(input.trim());
      if (grade == null || !grade.isFinite || grade < 0 || grade > 20) {
        setState(() {
          result = 'نمرات معتبر بین 0 تا 20 وارد کنید و با ویرگول جدا کنید.';
        });
        return;
      }
      grades.add(grade);
    }

    double sum = 0;
    int count = 0;

    for (double grade in grades) {
      sum = sum + grade;
      if (grade > 10) {
        count++;
      }
    }

    double average = sum / grades.length;

    setState(() {
      result = 'میانگین نمرات: ${average.toStringAsFixed(2)}\n'
          'تعداد افراد با نمره بیشتر از 10: $count';
    });
  }

  @override
  void dispose() {
    gradesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('محاسبه نمرات')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: gradesController,
                decoration: const InputDecoration(
                  labelText: 'نمرات با ارقام انگلیسی و جداشده با ویرگول',
                  hintText: '8, 10, 12, 18',
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: calculateGrades,
                child: const Text('محاسبه'),
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
