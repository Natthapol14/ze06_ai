import 'package:flutter/material.dart';
import 'score_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: QuizApp(),
  ));
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final List<Question> questions = [
    Question(
      questionText: 'เมืองหลวงของประเทศไทยคืออะไร?',
      answers: ['กรุงเทพมหานคร', 'เชียงใหม่', 'ภูเก็ต', 'หาดใหญ่'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'แม่น้ำสายใดที่ยาวที่สุดในประเทศไทย?',
      answers: ['แม่น้ำเจ้าพระยา', 'แม่น้ำโขง', 'แม่น้ำแม่กลอง', 'แม่น้ำตาปี'],
      correctAnswerIndex: 1,
    ),
    // เพิ่มอีก 8 ข้อ
    Question(
      questionText: 'ดวงอาทิตย์มีกี่ดวงในระบบสุริยะ?',
      answers: ['1', '2', '3', '4'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'สัตว์ชนิดใดมีจำนวนขา最多的?',
      answers: ['แมลงมุม', 'กิ้งก่า', 'ม้านิลมังกร', 'แมงกะพรุน'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'ประเทศใดมีประชากรมากที่สุดในโลก?',
      answers: ['จีน', 'อินเดีย', 'สหรัฐอเมริกา', 'อินโดนีเซีย'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'ภูเขาที่สูงที่สุดในประเทศไทยคืออะไร?',
      answers: ['ดอยอินทนนท์', 'ดอยหลวงเชียงดาว', 'ดอยสุเทพ', 'ภูหลวง'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'ธงชาติไทยมีสีอะไร?',
      answers: ['แดง ขาว น้ำเงิน', 'เหลือง เขียว แดง', 'ขาว น้ำเงิน แดง', 'เขียว เหลือง แดง'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'ดอกไม้ประจำชาติไทยคืออะไร?',
      answers: ['กล้วยไม้', 'บัวหลวง', 'ดาวเรือง', 'ทานตะวัน'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'สัตว์ประจำชาติไทยคืออะไร?',
      answers: ['ช้าง', 'เสือ', 'ลิง', 'นกยูง'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'สีประจำชาติ?',
      answers: ['สีแดง สีขาว และสีน้ำเงิน', 'สีแดงและสีขาว', 'ขาว-น้ำเงิน-แดง', 'สีฟ้า-แดง'],
      correctAnswerIndex: 0,
    ),
  ];

 int _currentQuestionIndex = 0;
  int score = 0;

  void _nextQuestion() {
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      // ไปหน้า "You Score"
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(
            score: score,
            totalQuestions: questions.length,
          ),
        ),
      );
    }
  }

  void _checkAnswer(int answerIndex) {
    if (answerIndex == questions[_currentQuestionIndex].correctAnswerIndex) {
      score++;
    }
    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(questions[_currentQuestionIndex].questionText),
            for (var i = 0; i < questions[_currentQuestionIndex].answers.length; i++)
              ElevatedButton(
                onPressed: () => _checkAnswer(i),
                child: Text(questions[_currentQuestionIndex].answers[i]),
              ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
  });
}