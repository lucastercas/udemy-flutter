import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'unit.dart';
import 'converter_route.dart';

final _rowHeigth = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeigth / 2);

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units
  }) : assert(name != null), 
    assert(color != null), 
    assert(iconLocation != null),
    assert(units != null),
    super(key: key);

  void _navigateToConverter(BuildContext context) {
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              this.name
            )
          ),
          body: ConverterRouter(
            color: color,
            name: name,
            units: units
          ) 
        );
      }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeigth,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: () =>_navigateToConverter(context),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 45.0
                  )
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline
                  ),
                )
              ],
            )
          )
        )
      )
    );

  }
}