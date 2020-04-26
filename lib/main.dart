import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_acda/pages/info.dart';
import 'package:rpg_acda/pages/ficha.dart';
import 'package:rpg_acda/pages/personagens.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (context) => Info(),
  child: MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => ACDA(),
    '/ficha': (context) => Ficha(),
    '/personagens': (context) => Personagens(),
  },
  theme: ThemeData(accentColor: Colors.white, primaryColor: Colors.black),
)));

class ACDA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg_acda.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'As Crônicas de Aligor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'MaturaMTScriptCapitals',
                  fontSize: 50.0,
                ),
              ),
            ),
            SizedBox(height: 25.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/personagens');
                },
                color: Colors.black,
                child: Text(
                  'Entrar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'MaturaMTScriptCapitals',
                  ),
                ),
              ),
            ),
            Container(
              child: Image(
                image: AssetImage("assets/grupo.jpg"),
              ),
            ),
          ]
        ),
      ),
    );
  }
}