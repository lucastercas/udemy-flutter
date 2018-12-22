import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';

final  _backgroundColor = Colors.green[100];

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  var _categories = <Category>[];

  @override
  void initState() {
    super.initState();
    _categories = createCategories();
  }  

  Widget _buildWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _categories[index],
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: _backgroundColor,
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


List<Widget> createCategories() {
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
        iconLocation: Icons.cake,
        units: getUnitList(_categoryNames[i])
      )
    );
  }
  return widgetsList;
}

List<Unit> getUnitList(String category) {
  return List.generate(10, (int i) {
    i += 1;
    return Unit(
      name: '$category Unit $i',
      conversion: i.toDouble(),
    );
  });
}


