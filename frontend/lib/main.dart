import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(firebaseauth());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(0, 136, 170, 1),
    ),
  );
}

class firebaseauth extends StatefulWidget {
  @override
  _firebaseauthState createState() => _firebaseauthState();
}

class _firebaseauthState extends State<firebaseauth> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (err) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      // show error message here
    }
    if (!_initialized) {
      // show loader until flutterfire initialized
    }

    return mainscreen();
  }
}

class mainscreen extends StatelessWidget {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'leARn',
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Image(image: AssetImage('assets/logos/logo.png')),
                  ),
                ),
                login()
              ],
            )));
  }
}

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text('hi'),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class leARn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          HeaderRow(),
          ClassView(),
          ClassListItem(),
        ],
      ),
    );
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
            margin: EdgeInsets.all(10.0),
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

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  final List<ClassListItem> _classItem = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _classItem[index],
            itemCount: _classItem.length,
          ),
        )
      ],
    );
  }
}

class ClassListItem extends StatelessWidget {
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

void _onItemReceival() {
  // put incoming json data into classlistitem
  // push classlistitem into the listview
}
