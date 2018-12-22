import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'unit.dart';

class ConverterRouter extends StatefulWidget {
  final String name;
  final Color color;
  final List<Unit> units;

  const ConverterRouter({
    @required this.name,
    @required this.color,
    @required this.units
  }) : assert(name != null),
  assert(color != null),
  assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRouter> {

  @override
  Widget build(BuildContext context) {
    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead
            )
          ],
        )
      );
    }).toList();

    return ListView(
      children: unitWidgets
    );
  }
}
