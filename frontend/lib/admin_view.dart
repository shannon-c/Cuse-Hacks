import 'package:flutter/material.dart';

void main() {
  runApp(admin());
}

class admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'leARn',
        home: Scaffold(
          appBar: AppBar(
            title: Text('leARn'),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Text('test'),
                ),
              )
            ],
          ),
        ));
  }
}

class ClassListItem extends StatelessWidget {
  ClassListItem({this.code, this.name});

  final String code, name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Column(
        children: [
          Text(code, style: TextStyle(fontFamily: 'Poiret', fontSize: 14.0, color: Colors.black)),
          Text(name, style: TextStyle(fontFamily: 'Poiret', fontSize: 18.0, color: Colors.black)),
        ],
      ),
    );
  }
}

class ClassList extends StatelessElement {
  ClassList(StatelessWidget widget) : super(widget);

  @override
  Widget build() {
    // TODO: implement build
    return super.build();
  }
}
