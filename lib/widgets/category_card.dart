import 'package:flutter/material.dart';
import '../models/category.dart';

// Este widget não é mais usado diretamente
// As funcionalidades foram movidas para _buildCategoryCard na CategorySelectionScreen
class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;
  final Color borderColor; // Adicione borderColor

  const CategoryCard({Key? key, required this.category, required this.onTap, required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: borderColor,
            width: 3.0,
          ),
        ),
        child: Center(
          child: Text(
            category.name,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}