import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String text;
  final bool isCorrect;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.text,
    required this.isCorrect,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? (isCorrect ? Colors.green.shade100 : Colors.red.shade100)
              : Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(text),
      ),
    );
  }
}