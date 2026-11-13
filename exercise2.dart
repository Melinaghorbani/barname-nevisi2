import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AgePage(),
  ));
}

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  final birthYearController = TextEditingController();
  String result = '';

  void calculateAge() {
    // سال جاری شمسی؛ در سال بعد این مقدار را تغییر می‌دهیم.
    const int currentYear = 1405;
    int? birthYear = int.tryParse(birthYearController.text.trim());

    setState(() {
      if (birthYear == null || birthYear <= 0 || birthYear > currentYear) {
        result = 'سال تولد معتبر وارد کنید.';
      } else {
        int age = currentYear - birthYear;
        result = 'سن شما: $age سال';
      }
    });
  }

  @override
  void dispose() {
    birthYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('محاسبه سن')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: birthYearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'سال تولد شمسی',
                  hintText: 'مثلاً 1385 (با ارقام انگلیسی)',
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: calculateAge,
                child: const Text('محاسبه سن'),
              ),
              const SizedBox(height: 24),
              Text(result, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
