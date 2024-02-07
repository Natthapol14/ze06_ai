import 'package:flutter/material.dart';
import 'package:ze06_ai/main.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ScoreScreen({
    Key? key,
    required this.score,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผลคะแนน'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('คะแนนของคุณ: $score/$totalQuestions'),
            ElevatedButton(
              onPressed: () {
                // ไปหน้าทำแบบทดสอบ
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizApp(),
                  ),
                );
              },
              child: Text('เริ่มทำแบบทดสอบใหม่'),
            ),
          ],
        ),
      ),
    );
  }
}