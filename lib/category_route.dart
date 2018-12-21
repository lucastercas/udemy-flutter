import 'package:flutter/material.dart';
import 'category.dart';

const _categoryIcon = Icons.cake;

createCategories() {
  const _categoryNames = <String>[
    'Tamanho',
    'Área',
    'Volume',
    'Massa',
    'Tempo',
    'Armazenamento Digital',
    'Energia',
    'Moeda'
  ];

  const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red
  ];

  var widgetsList = <Category>[];
  for(var i = 0; i < _categoryNames.length; i++) {
    widgetsList.add(
      new Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: _categoryIcon,
      )
    );
  }
  return widgetsList;
}

class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  Widget _buildWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {

    final listView = Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildWidgets(createCategories())
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        "Categories Screen",
        style: TextStyle(
          color: Colors.black
        )
      ),
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}