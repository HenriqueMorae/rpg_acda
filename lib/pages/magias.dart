import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rpg_acda/pages/info.dart';

class Magias extends StatelessWidget {
  final List<String> niveis = ['1','2','3','4','5','6','7','8','9'];

  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget> [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: SizedBox(
                      width: 180,
                      height: 95,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).magia[0];
                          return Alert(
                            context: context,
                            title: 'Classe Conjuradora',
                            content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'classemagia');
                                  Navigator.pop(context);
                                }
                              )
                            ]
                          ).show();
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Text(
                              personagem.magia[0],
                              style: TextStyle(fontSize: 25.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  Text('Classe Conjuradora', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 150,
                      height: 70,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).magia[1];
                          return Alert(
                            context: context,
                            title: 'Atributo de Conjuração',
                            content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'atrmagia');
                                  Navigator.pop(context);
                                }
                              )
                            ]
                          ).show();
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Text(
                              personagem.magia[1],
                              style: TextStyle(fontSize: 20.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  Text('Atributo de', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Conjuração', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 100,
                      height: 70,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).magia[2];
                          return Alert(
                            context: context,
                            title: 'CD para Evitar suas Magias',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'cdmagia');
                                  Navigator.pop(context);
                                }
                              )
                            ]
                          ).show();
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Text(
                              personagem.magia[2],
                              style: TextStyle(fontSize: 40.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  Text('CD para Evitar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('suas Magias', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(width: 40),
              Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 100,
                      height: 70,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).magia[3];
                          return Alert(
                            context: context,
                            title: 'Modificador de Ataque Mágico',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'modmagia');
                                  Navigator.pop(context);
                                }
                              )
                            ]
                          ).show();
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Text(
                              personagem.magia[3],
                              style: TextStyle(fontSize: 40.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  Text('Modificador de', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Ataque Mágico', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Text('Círculo          Utilizados/Total        Editar     ', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
          Container(
            color: Colors.white,
            height: 400,
            width: 280,
            child: Consumer<Info> (
              builder: (context, personagem, child) {
                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Colors.black),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text(niveis[index], style: TextStyle(fontSize: 30)),
                      title: Row(
                        children: <Widget> [
                          IconButton(icon: Icon(Icons.remove), iconSize: 30, onPressed: (){personagem.tiramagia(index);}),
                          Text(personagem.usados[index].toString() + '/' + personagem.espacos[index], style: TextStyle(fontSize: 20)),
                          IconButton(icon: Icon(Icons.add), iconSize: 30, onPressed: (){personagem.addmagia(index);}),
                        ]
                      ),
                      trailing: IconButton(icon: Icon(Icons.edit),
                        onPressed: () {
                          myController.text = personagem.espacos[index];
                          return Alert(
                            context: context,
                            title: 'Editar Espaços de Magia',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).updatecoisa(myController.text, index, 'magia');
                                  Navigator.pop(context);
                                }
                              )
                            ]
                          ).show();
                        },
                      ),
                    );
                  }
                );
              }
            )
          ),
          SizedBox(height: 20),
        ]
      )
    );
  }
}