import 'category.dart';

class Question {
  final String text;
  final List<String> options;
  final String correctAnswer;
  final Category category;

  Question({
    required this.text,
    required this.options,
    required this.correctAnswer,
    required this.category,
  });
}