import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PersonalInfoPage(),
  ));
}

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();

  String result = '';

  void showInformation() {
    setState(() {
      result = 'نام: ${nameController.text}\n'
          'نام خانوادگی: ${lastNameController.text}\n'
          'شماره: ${phoneController.text}\n'
          'سن: ${ageController.text}';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مشخصات فرد'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'نام'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'نام خانوادگی'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'شماره'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'سن'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: showInformation,
                child: const Text('نمایش اطلاعات'),
              ),
              const SizedBox(height: 24),
              Text(
                result,
                style: const TextStyle(fontSize: 18, height: 1.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
