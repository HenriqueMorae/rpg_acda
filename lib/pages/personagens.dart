import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';
import 'package:rpg_acda/pages/info.dart';

class Personagens extends StatelessWidget {
  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Info>(context, listen: false).abrirlista();

    return Consumer<Info>(
      builder: (context, personagem, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text('Personagens'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add_circle_outline), iconSize: 35, 
                onPressed: () {
                  myController.text = '';
                  return Alert(
                    context: context,
                    title: 'Novo Personagem',
                    desc: 'Após a criação, o nome não poderá ser modificado.',
                    content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                    buttons: [
                      DialogButton(
                        color: Colors.black,
                        child: Text('Criar', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          if (personagem.listadepersonagens.contains(myController.text)){
                            Alert(
                              context: context,
                              title: 'Nome Inválido',
                              desc: 'Um personagem com esse nome já existe',
                              buttons: [
                                DialogButton(color: Colors.black, child: Text('OK', style: TextStyle(color: Colors.white),), onPressed: () {Navigator.pop(context);})
                              ]
                            ).show();
                          } else {
                            Provider.of<Info>(context, listen: false).addcoisa(myController.text, 'lista');
                            Provider.of<Info>(context, listen: false).salvarlista();
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/ficha', arguments: {'id': myController.text, 'novo': true});
                          }
                        }
                      )
                    ]
                  ).show();
                }
              ),
            ],
          ),
          backgroundColor: Colors.grey,
          body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red, child: Icon(Icons.cancel), alignment: Alignment.centerRight, padding: EdgeInsets.all(10)),
                child: ListTile(
                  title: Text(personagem.listadepersonagens[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.pushNamed(context, '/ficha', arguments: {'id': personagem.listadepersonagens[index], 'novo': false});
                  },
                  leading: Icon(Icons.account_circle, size: 40),
                ),
                onDismissed: (direction) {
                  Provider.of<Info>(context, listen: false).deletelista(personagem.listadepersonagens[index]);
                  Provider.of<Info>(context, listen: false).tiracoisa(personagem.listadepersonagens[index], 'lista');
                  Provider.of<Info>(context, listen: false).salvarlista();
                },
                direction: DismissDirection.endToStart,
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white),
            itemCount: personagem.listadepersonagens.length
          )
        );
      }
    );
  }
}