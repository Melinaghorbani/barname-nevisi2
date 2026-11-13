import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PasswordPage(),
  ));
}

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final passwordController = TextEditingController();
  final String password = '1234';
  String result = '';
  bool isCorrect = false;

  void checkPassword() {
    String enteredPassword = passwordController.text;

    setState(() {
      if (enteredPassword == password) {
        result = 'درست است';
        isCorrect = true;
      } else {
        result = 'رمز نادرست است';
      }
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('بررسی رمز عبور')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: passwordController,
                obscureText: true,
                enabled: !isCorrect,
                decoration: const InputDecoration(labelText: 'رمز عبور'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isCorrect ? null : checkPassword,
                child: const Text('بررسی رمز'),
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
