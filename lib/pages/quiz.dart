import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatefulWidget {
  @override
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int _currentIndex = 0;
  int _score = 0;

  List<Question> _questions = [
    Question(
      'Where is DIU located?',
      ['Chittagong', 'Ashulia', 'Mirpur', 'Pabna'],
      'Ashulia',
    ),
    Question(
      'What kind of institution is DIU?',
      ['Educational', 'Profitable', 'Industrial', 'Govt.'],
      'Educational',
    ),
    Question(
      'What kind of country is BD?',
      ['Developed', 'Undeveloped', 'Non-Inependent', 'Developing'],
      'Developing',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Some Quiz'),
      ),
      body: _currentIndex < _questions.length
          ? QuizQuestionPage(
        question: _questions[_currentIndex],
        onAnswerSelected: _handleAnswer,
      )
          : QuizResultPage(
        score: _score,
        totalQuestions: _questions.length,
        onRestartQuiz: _restartQuiz,
      ),
    );
  }

  void _handleAnswer(String selectedAnswer) {
    setState(() {
      if (_questions[_currentIndex].correctAnswer == selectedAnswer) {
        _score++;
      }
      _currentIndex++;
    });
  }

  void _restartQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
    });
  }
}

class QuizQuestionPage extends StatelessWidget {
  final Question question;
  final Function(String) onAnswerSelected;

  QuizQuestionPage({required this.question, required this.onAnswerSelected});

  @override
  Widget build(BuildContext context) {
    return Center( // Wrap with Center
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Column(
            children: question.options.map((option) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    onAnswerSelected(option);
                  },
                  child: Text(option),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class QuizResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Function onRestartQuiz;

  QuizResultPage({
    required this.score,
    required this.totalQuestions,
    required this.onRestartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Center( // Wrap with Center
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Completed!',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            'Your Score: $score / $totalQuestions',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onRestartQuiz();
            },
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final String correctAnswer;

  Question(this.text, this.options, this.correctAnswer);
}