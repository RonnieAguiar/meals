import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dammy_data.dart';

class CategorriesScreen extends StatelessWidget {
  const CategorriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Vamos cozinhar?')),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCategories
            .map(
              (cat) => CategoryItem(category: cat),
            )
            .toList(),
      ),
    );
  }
}
