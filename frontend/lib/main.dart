import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(leARn());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.deepOrange));
}

// ignore: camel_case_types
class leARn extends StatelessWidget {
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
              HeaderRow(),
              ClassView(),
              ClassListItem(),
            ],
          ),
        ));
  }
}

class ClassView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Text(
              'Classes',
              style: TextStyle(
                  fontFamily: 'Poiret',
                  fontSize: 30.0,
                  color: Color.fromRGBO(0, 136, 170, 1)),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}

class ClassListItem extends StatelessWidget {
  ClassListItem({this.classData});

  final Object classData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Advanced Mathematics',
                      style: TextStyle(fontFamily: 'Poiret', fontSize: 35),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Mondays',
                      style: TextStyle(fontFamily: 'Poiret', fontSize: 25),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '6:30 - 9:30',
                      style: TextStyle(fontFamily: 'Poiret', fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.usnews.com/dims4/USNEWS/9b4381c/2147483647/thumbnail/640x420/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2F16%2F8a%2F7f6cb88e4a4bae4b0dd576654aa1%2Fcomplexmathequation.jpg'),
                radius: 75.0,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color.fromRGBO(227, 222, 219, 1),
            const Color.fromRGBO(172, 157, 147, 1)
          ],
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Image(image: AssetImage('assets/logos/logo.png')),
            )),
        SizedBox(width: 100),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.insider.com/5ca1d6ccc6cc50118c102b34?width=700'),
              radius: 40.0,
            ),
          ),
        )
      ],
    );
  }
}
