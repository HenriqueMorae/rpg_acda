import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';
import 'package:rpg_acda/pages/info.dart';

class Vida extends StatelessWidget {
  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('CA', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 90,
                    height: 60,
                    child: FlatButton(
                      onPressed: () {
                        myController.text = Provider.of<Info>(context, listen: false).classearmadura;
                        return Alert(
                          context: context,
                          title: 'Classe de Armadura',
                          content: TextField(controller: myController, keyboardType: TextInputType.number),
                          buttons: [
                            DialogButton(
                              color: Colors.black,
                              child: Text('OK', style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                Provider.of<Info>(context, listen: false).setinfo(myController.text, 'ca');
                                Navigator.pop(context);
                              }
                            )
                          ]
                        ).show();
                      },
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: CircleBorder(),
                      child: Consumer<Info>(
                        builder: (context, personagem, child) {
                          return Text(
                            personagem.classearmadura,
                            style: TextStyle(fontSize: 30.0),
                          );
                        }
                      )
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Iniciativa', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 90,
                      height: 60,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Text(
                              personagem.mod[1],
                              style: TextStyle(fontSize: 30.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Deslocamento', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      width: 90,
                      height: 60,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).deslocamento;
                          return Alert(
                            context: context,
                            title: 'Deslocamento',
                            content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'deslocamento');
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
                              personagem.deslocamento,
                              style: TextStyle(fontSize: 25.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 70,
                  height: 40,
                  child: FlatButton(
                    onPressed: () {},
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Consumer<Info>(
                      builder: (context, personagem, child) {
                        return Text(
                          personagem.passivo(),
                          style: TextStyle(fontSize: 20.0),
                        );
                      }
                    )
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('Sabedoria Passiva (Percepção)', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Text('Pontos de Vida', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<Info>(builder: (context, personagem,child) {return Icon(Icons.favorite, size: 60, color: personagem.vida());}),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Atuais', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 120,
                      height: 80,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).pvatual;
                          return Alert(
                            context: context,
                            title: 'Pontos de Vida Atuais',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'pvat');
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
                              personagem.pvatual,
                              style: TextStyle(fontSize: 50.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Máximos', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 120,
                      height: 80,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).pvmaximo;
                          return Alert(
                            context: context,
                            title: 'Pontos de Vida Máximos',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'pvmax');
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
                              personagem.pvmaximo,
                              style: TextStyle(fontSize: 50.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Temporários', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 90,
                  height: 40,
                  child: FlatButton(
                    onPressed: () {
                      myController.text = Provider.of<Info>(context, listen: false).pvtemporario;
                      return Alert(
                        context: context,
                        title: 'Pontos de Vida Temporários',
                        content: TextField(controller: myController, keyboardType: TextInputType.number),
                        buttons: [
                          DialogButton(
                            color: Colors.black,
                            child: Text('OK', style: TextStyle(color: Colors.white),),
                            onPressed: () {
                              Provider.of<Info>(context, listen: false).setinfo(myController.text, 'pvtem');
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
                          personagem.pvtemporario,
                          style: TextStyle(fontSize: 25.0),
                        );
                      }
                    )
                  ),
                ),
              ),
              Consumer<Info>(
                builder: (context, personagem, child) {
                  return Icon(Icons.security, size: 40,
                    color: personagem.temp() ? Colors.amber : Colors.black);
                }
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Total', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: FlatButton(
                      onPressed: () {
                        myController.text = Provider.of<Info>(context, listen: false).totaldadodevida;
                        return Alert(
                          context: context,
                          title: 'Total de Dados de Vida',
                          content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                          buttons: [
                            DialogButton(
                              color: Colors.black,
                              child: Text('OK', style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                Provider.of<Info>(context, listen: false).setinfo(myController.text, 'tddv');
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
                            personagem.totaldadodevida,
                            style: TextStyle(fontSize: 20.0),
                          );
                        }
                      )
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 150,
                    height: 100,
                    child: FlatButton(
                      onPressed: () {
                        myController.text = Provider.of<Info>(context, listen: false).dadodevida;
                        return Alert(
                          context: context,
                          title: 'Dados de Vida',
                          content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                          buttons: [
                            DialogButton(
                              color: Colors.black,
                              child: Text('OK', style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                Provider.of<Info>(context, listen: false).setinfo(myController.text, 'ddv');
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
                            personagem.dadodevida,
                            style: TextStyle(fontSize: 25.0),
                          );
                        }
                      )
                    ),
                  ),
                  Text('Dados de Vida', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: <Widget>[
                  Text('Salvaguarda contra Morte', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  Row(
                    children: <Widget>[
                      IconButton(
                        iconSize: 40,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.sucessos[0] ? Icons.favorite : Icons.favorite_border,
                              color: personagem.sucessos[0] ? Colors.red : Colors.white);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(0, 'vida');
                        }
                      ),
                      IconButton(
                        iconSize: 40,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.sucessos[1] ? Icons.favorite : Icons.favorite_border,
                              color: personagem.sucessos[1] ? Colors.red : Colors.white);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(1, 'vida');
                        }
                      ),
                      IconButton(
                        iconSize: 40,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.sucessos[2] ? Icons.favorite : Icons.favorite_border,
                              color: personagem.sucessos[2] ? Colors.red : Colors.white);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(2, 'vida');
                        }
                      ),
                    ],
                  ),
                  Text('Sucessos', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  Row(
                    children: <Widget>[
                      IconButton(
                        iconSize: 40,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.falhas[0] ? Icons.cancel : Icons.radio_button_unchecked,
                              color: personagem.falhas[0] ? Colors.red : Colors.white);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(0, 'morte');
                        }
                      ),
                      IconButton(
                        iconSize: 40,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.falhas[1] ? Icons.cancel : Icons.radio_button_unchecked,
                              color: personagem.falhas[1] ? Colors.red : Colors.white);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(1, 'morte');
                        }
                      ),
                      IconButton(
                        iconSize: 40,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.falhas[2] ? Icons.cancel : Icons.radio_button_unchecked,
                              color: personagem.falhas[2] ? Colors.red : Colors.white);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(2, 'morte');
                        }
                      ),
                    ],
                  ),
                  Text('Falhas', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Proficiências', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 105),
              IconButton(icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 35),
                onPressed: () {
                  myController.text = '';
                  return Alert(
                    context: context,
                    title: 'Nova Proficiência',
                    content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                    buttons: [
                      DialogButton(
                        color: Colors.black,
                        child: Text('OK', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          Provider.of<Info>(context, listen: false).addcoisa(myController.text, 'pro');
                          Navigator.pop(context);
                        }
                      )
                    ]
                  ).show();
                }
              )
            ],
          ),
          Container(
            color: Colors.white,
            height: 200,
            width: 240,
            child: Consumer<Info>(
              builder: (context, personagem, child) {
                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Colors.black),
                  itemCount: personagem.proficiencias.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red, child: Icon(Icons.cancel), alignment: Alignment.centerRight, padding: EdgeInsets.all(10)),
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(personagem.proficiencias[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          dense: true,
                          onTap: () {
                            myController.text = personagem.proficiencias[index];
                            return Alert(
                              context: context,
                              title: 'Editar Proficiência',
                              content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                              buttons: [
                                DialogButton(
                                  color: Colors.black,
                                  child: Text('OK', style: TextStyle(color: Colors.white),),
                                  onPressed: () {
                                    Provider.of<Info>(context, listen: false).updatecoisa(myController.text, index, 'pro');
                                    Navigator.pop(context);
                                  }
                                )
                              ]
                            ).show();
                          }
                        ),
                      ),
                      onDismissed: (direction) {
                        Provider.of<Info>(context, listen: false).tiracoisa(personagem.proficiencias[index], 'pro');
                      },
                      direction: DismissDirection.endToStart,
                    );
                  },
                );
              }
            ),
          ),
          SizedBox(height: 20),
        ]
      ),
    );
  }
}