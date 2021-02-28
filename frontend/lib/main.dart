import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  @override
  Widget build(BuildContext context) {
    _firebaseauthState();

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        // do sign out things here...
      } else {
        print('User is signed in!');
        // do sign in things here...
      }
    });

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
                SizedBox(
                  height: 200,
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

  Future<UserCredential> signInWithGoogle() async {
    // trigger auth flow
    final GoogleSignInAccount googleSignInAccount =
        await GoogleSignIn().signIn();

    // obtain auth deets from req
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final GoogleAuthCredential googleAuthCredential =
        GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    // once signed in, return the user cred
    return await FirebaseAuth.instance
        .signInWithCredential(googleAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Signing in!'),
                ));

                signInWithGoogle();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => leARn()));
              },
              child: Image(
                image: AssetImage('assets/icons/google_sign_in.png'),
                fit: BoxFit.contain,
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class leARn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            HeaderRow(),
            ClassView(),
            ClassListItem(
              panel: Panel('McMaster University', "Wednesdays", '6:30 - 9:30', 'https://brighterworld.mcmaster.ca/wp-content/uploads/sites/2/2018/07/20180706-152629-McMaster-University-Campus-0004-1.jpg'),
            ),
            // ClassList(
            // panels: List.generate(
            // 4,
            // (index) => Panel('Title', 'Days', 'Times',
            // 'https://i.ytimg.com/vi/9qnaJexpdrM/maxresdefault.jpg'))),
          ],
        ),
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

class ClassList extends StatelessWidget {
  final List<Panel> panels;

  ClassList({Key key, @required this.panels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (context, index) {
              return ClassListItem(
                panel: panels[index],
              );
            },
            itemCount: panels.length,
          ),
        ),
      ],
    );
  }
}

class ClassListItem extends StatelessWidget {
  @override
  final Panel panel;

  ClassListItem({
    Key key,
    @required this.panel,
  }) : super(key: key);

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
                      panel.title,
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
                      panel.subtitle,
                      style: TextStyle(fontFamily: 'Poiret', fontSize: 25),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      panel.times,
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
                backgroundImage: NetworkImage(panel.imageuri),
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

class Panel {
  final String title;
  final String subtitle;
  final String times;
  final String imageuri;

  Panel(this.title, this.subtitle, this.times, this.imageuri);
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
