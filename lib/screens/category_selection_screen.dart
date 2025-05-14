import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/category.dart';
import '../data/quiz_data.dart';
import '../widgets/category_card.dart';
import 'question_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'), // Título "Categorias"
        backgroundColor: Colors.white, // AppBar branca
        foregroundColor: Colors.black, // Texto da AppBar preto
        elevation: 0, // Remover sombra da AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient( // Fundo com gradiente sutil
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE0F2F1), // Tom de verde claro
              Colors.white,
            ],
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Uma coluna
            mainAxisSpacing: 10.0, // Espaçamento vertical entre os cards
            mainAxisExtent: 80.0, // Altura dos cards
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            Color borderColor = _getBorderColor(index); // Função para obter a cor da borda
            return _buildCategoryCard(context, categories[index], borderColor); // Usar _buildCategoryCard
          },
        ),
      ),
    );
  }

  // Widget para construir o card de categoria
  Widget _buildCategoryCard(BuildContext context, Category category, Color borderColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreen(category: category),
          ),
        );
      },
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

  // Função para definir a cor da borda com base no índice
  Color _getBorderColor(int index) {
    const List<Color> colors = [
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.red,
      Colors.purple,
    ];
    return colors[index % colors.length]; // Garante que as cores se repitam se houver mais categorias
  }
}