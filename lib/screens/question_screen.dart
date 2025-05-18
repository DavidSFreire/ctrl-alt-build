import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/category_selection_screen.dart';
import 'dart:math';
import '../models/category.dart';
import '../models/question.dart';
import '../data/quiz_data.dart';

class QuestionScreen extends StatefulWidget {
  final Category category;

  const QuestionScreen({Key? key, required this.category}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _questionIndex = 0;
  String? _selectedAnswer;
  bool _answerChecked = false;
  List<Question> _questions = [];

  @override
  void initState() {
    super.initState();
    _questions = questions.where((q) => q.category == widget.category).toList();
    _questions.shuffle();
  }

  Question get _currentQuestion => _questions[_questionIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2F1), // Cor de fundo verde claro
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildQuestionCard(),
            const SizedBox(height: 20.0),
            ..._buildAnswerOptions(),
            const SizedBox(height: 20.0),
            _buildVerifyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        _currentQuestion.text,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<Widget> _buildAnswerOptions() {
    return _currentQuestion.options.map((option) => Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: _selectedAnswer,
            onChanged: _answerChecked
                ? null
                : (value) {
                    setState(() {
                      _selectedAnswer = value;
                    });
                  },
            controlAffinity: ListTileControlAffinity.trailing,
            // Visual customization
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        )).toList();
  }

  Widget _buildVerifyButton() {
    return ElevatedButton(
      onPressed: _selectedAnswer != null && !_answerChecked
          ? () {
              setState(() {
                _answerChecked = true;
              });
              _showResultDialog();
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF264653), // Cor verde escuro
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text(
        'Verificar resposta',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            _selectedAnswer == _currentQuestion.correctAnswer
                ? 'Correto!'
                : 'Incorreto!',
          ),
          content: Text(
            _selectedAnswer == _currentQuestion.correctAnswer
                ? 'Parabéns, você acertou!'
                : 'Você errou. A resposta correta é: ${_currentQuestion.correctAnswer}',
          ),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CategorySelectionScreen()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _nextQuestion() {
    setState(() {
      _answerChecked = false;
      _selectedAnswer = null;
      _questionIndex++;
    });
  }
}