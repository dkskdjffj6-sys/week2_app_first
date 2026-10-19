import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '더하기 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddScreen(),
    );
  }
}

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  // 입력값을 제어하기 위한 컨트롤러
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  // 결과를 저장할 변수
  double _result = 0;

  // 더하기 연산 함수
  void _calculateSum() {
    double val1 = double.tryParse(_num1Controller.text) ?? 0;
    double val2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _result = val1 + val2;
    });
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('숫자 더하기 앱'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 첫 번째 입력창
                TextField(
                  controller: _num1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '첫 번째 숫자 입력',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // 두 번째 입력창
                TextField(
                  controller: _num2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '두 번째 숫자 입력',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // 더하기 버튼
                ElevatedButton(
                  onPressed: _calculateSum,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    '더하기',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 24),

                // 결과 출력 영역
                Text(
                  '결과: $_result',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}