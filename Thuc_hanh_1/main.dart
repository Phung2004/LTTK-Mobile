import 'package:flutter/material.dart';

void main() {
  runApp(const Thuchanh1());
}

class Thuchanh1 extends StatelessWidget {
  const Thuchanh1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const AgeCheckerScreen(),
    );
  }
}

class AgeCheckerScreen extends StatefulWidget {
  const AgeCheckerScreen({super.key});

  @override
  State<AgeCheckerScreen> createState() => _AgeCheckerScreenState();
}

class _AgeCheckerScreenState extends State<AgeCheckerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _result = '';

  void _checkAge() {
    String name = _nameController.text;
    final int age = int.tryParse(_ageController.text) ?? 0;
    setState(() {
      if (name.isEmpty) {
        _result = 'Vui lòng nhập tên';
      } else if (age == 0) {
        _result = 'Vui lòng nhập tuổi hợp lệ';
      } else if (age < 18) {
        _result = '$name là thiếu niên';
      } else if (age < 30) {
        _result = '$name là thanh niên';
      } else if (age < 50) {
        _result = '$name là người trung niên';
      } else {
        _result = '$name là người già';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kiểm tra độ tuổi')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nhập tên của bạn',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập tuổi của bạn',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAge,
              child: const Text('Kiểm tra'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
