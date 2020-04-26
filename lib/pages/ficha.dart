import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_acda/pages/info.dart';
import 'package:rpg_acda/pages/atributos.dart';
import 'package:rpg_acda/pages/vida.dart';
import 'package:rpg_acda/pages/pericias.dart';
import 'package:rpg_acda/pages/inventario.dart';
import 'package:rpg_acda/pages/magias.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Ficha extends StatefulWidget {
  @override
  _FichaState createState() => _FichaState();
}

class _FichaState extends State<Ficha> {

  Map perso = {};
  int _currentIndex = 0;
  bool primeiro = true;

  final List<Widget> _tabs = [
    Atributos(),
    Pericias(),
    Vida(),
    Inventario(),
    Magias(),
  ];

  @override
  Widget build(BuildContext context) {
    perso = ModalRoute.of(context).settings.arguments;

    if (primeiro) {
      Provider.of<Info>(context, listen: false).setid(perso['id'], perso['novo']);
      primeiro = false;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Ficha de ${perso['id']}'),
        actions: <Widget>[
          Salvar(),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 40.0),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('Atributos')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Perícias')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Vida')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.colorize),
            title: Text('Inventário')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Magias')
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg_ficha.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _tabs[_currentIndex],
        ),
      ),
    );
  }
}

class Salvar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.save),
      onPressed: () {
        return Alert(
          context: context,
          title: 'Salvar Personagem?',
          buttons: [
            DialogButton(
              color: Colors.black,
              child: Text('Não', style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            DialogButton(
              color: Colors.black,
              child: Text('Sim', style: TextStyle(color: Colors.white),),
              onPressed: () {
                Provider.of<Info>(context, listen: false).salvar();
                Navigator.pop(context);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Personagem Salvo', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  backgroundColor: Colors.white,
                  action: SnackBarAction(label: 'Salvar\nNovamente', textColor: Colors.grey, onPressed: () {
                    Provider.of<Info>(context, listen: false).salvar();
                  }))
                );
              },
            ),
          ]
        ).show();
      }
    );
  }
}
