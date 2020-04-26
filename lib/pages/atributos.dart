import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';
import 'package:rpg_acda/pages/info.dart';

class Atributos extends StatelessWidget {
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
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: FlatButton(
                      onPressed: () {
                        myController.text = Provider.of<Info>(context, listen: false).nome;
                        return Alert(
                          context: context,
                          title: 'Nome',
                          content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                          buttons: [
                            DialogButton(
                              color: Colors.black,
                              child: Text('OK', style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                Provider.of<Info>(context, listen: false).setinfo(myController.text, 'nome');
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
                            personagem.nome,
                            style: TextStyle(fontSize: 25.0),
                          );
                        }
                      )
                    ),
                  ),
                  Text('Nome', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(width: 40),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 70,
                    height: 60,
                    child: FlatButton(
                      onPressed: () {
                        myController.text = Provider.of<Info>(context, listen: false).nivel;
                        return Alert(
                          context: context,
                          title: 'Nível',
                          content: TextField(controller: myController, keyboardType: TextInputType.number),
                          buttons: [
                            DialogButton(
                              color: Colors.black,
                              child: Text('OK', style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                Provider.of<Info>(context, listen: false).setinfo(myController.text, 'nivel');
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
                            personagem.nivel,
                            style: TextStyle(fontSize: 25.0),
                          );
                        }
                      )
                    ),
                  ),
                  Text('Nível', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 220,
                    height: 25,
                    child: FlatButton(
                      onPressed: () {
                        myController.text = Provider.of<Info>(context, listen: false).classe;
                        return Alert(
                          context: context,
                          title: 'Classe',
                          content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                          buttons: [
                            DialogButton(
                              color: Colors.black,
                              child: Text('OK', style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                Provider.of<Info>(context, listen: false).setinfo(myController.text, 'classe');
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
                            personagem.classe,
                            style: TextStyle(fontSize: 15.0),
                          );
                        }
                      )
                    ),
                  ),
                  Text('Classe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 220,
                    height: 25,
                    child: FlatButton(
                      onPressed: () {
                        myController.text = Provider.of<Info>(context, listen: false).raca;
                        return Alert(
                          context: context,
                          title: 'Raça',
                          content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                          buttons: [
                            DialogButton(
                              color: Colors.black,
                              child: Text('OK', style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                Provider.of<Info>(context, listen: false).setinfo(myController.text, 'raca');
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
                            personagem.raca,
                            style: TextStyle(fontSize: 15.0),
                          );
                        }
                      )
                    ),
                  ),
                  Text('Raça', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 70,
                    height: 60,
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: CircleBorder(),
                      child: Consumer<Info>(
                        builder: (context, personagem, child) {
                          return Text(
                            personagem.bonus,
                            style: TextStyle(fontSize: 25.0),
                          );
                        }
                      )
                    ),
                  ),
                  Text('Bônus de', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Proficiência', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Text('Inspiração', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                iconSize: 40,
                icon: Consumer<Info>(
                  builder: (context, personagem, child) {
                    return Icon(personagem.inspiracao[0] ? Icons.star : Icons.star_border,
                      color: personagem.inspiracao[0] ? Colors.purple[300] : Colors.white);
                  }
                ),
                onPressed: (){
                  Provider.of<Info>(context, listen: false).seticon(0, 'ins');
                }
              ),
              IconButton(
                iconSize: 40,
                icon: Consumer<Info>(
                  builder: (context, personagem, child) {
                    return Icon(personagem.inspiracao[1] ? Icons.star : Icons.star_border,
                      color: personagem.inspiracao[1] ? Colors.purple[300] : Colors.white);
                  }
                ),
                onPressed: (){
                  Provider.of<Info>(context, listen: false).seticon(1, 'ins');
                }
              ),
              IconButton(
                iconSize: 40,
                icon: Consumer<Info>(
                  builder: (context, personagem, child) {
                    return Icon(personagem.inspiracao[2] ? Icons.star : Icons.star_border,
                      color: personagem.inspiracao[2] ? Colors.purple[300] : Colors.white);
                  }
                ),
                onPressed: (){
                  Provider.of<Info>(context, listen: false).seticon(2, 'ins');
                }
              ),
              IconButton(
                iconSize: 40,
                icon: Consumer<Info>(
                  builder: (context, personagem, child) {
                    return Icon(personagem.inspiracao[3] ? Icons.star : Icons.star_border,
                      color: personagem.inspiracao[3] ? Colors.purple[300] : Colors.white);
                  }
                ),
                onPressed: (){
                  Provider.of<Info>(context, listen: false).seticon(3, 'ins');
                }
              ),
              IconButton(
                iconSize: 40,
                icon: Consumer<Info>(
                  builder: (context, personagem, child) {
                    return Icon(personagem.inspiracao[4] ? Icons.star : Icons.star_border,
                      color: personagem.inspiracao[4] ? Colors.purple[300] : Colors.white);
                  }
                ),
                onPressed: (){
                  Provider.of<Info>(context, listen: false).seticon(4, 'ins');
                }
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('FOR', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 70,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).forc;
                          return Alert(
                            context: context,
                            title: 'Força',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'for');
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
                              personagem.forc,
                              style: TextStyle(fontSize: 30.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: CircleBorder(),
                      child: Consumer<Info>(
                        builder: (context, personagem, child) {
                          return Text(
                            personagem.mod[0],
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          );
                        }
                      )
                    )
                  ),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('DES', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 70,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).des;
                          return Alert(
                            context: context,
                            title: 'Destreza',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'des');
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
                              personagem.des,
                              style: TextStyle(fontSize: 30.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: CircleBorder(),
                      child: Consumer<Info>(
                        builder: (context, personagem, child) {
                          return Text(
                            personagem.mod[1],
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          );
                        }
                      )
                    )
                  ),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('CON', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 70,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).con;
                          return Alert(
                            context: context,
                            title: 'Constituição',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'con');
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
                              personagem.con,
                              style: TextStyle(fontSize: 30.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: CircleBorder(),
                      child: Consumer<Info>(
                        builder: (context, personagem, child) {
                          return Text(
                            personagem.mod[2],
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          );
                        }
                      )
                    )
                  ),
                ],
              ),
            ]
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('INT', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 70,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).inte;
                          return Alert(
                            context: context,
                            title: 'Inteligência',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'int');
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
                              personagem.inte,
                              style: TextStyle(fontSize: 30.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: CircleBorder(),
                      child: Consumer<Info>(
                        builder: (context, personagem, child) {
                          return Text(
                            personagem.mod[3],
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          );
                        }
                      )
                    )
                  ),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('SAB', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 70,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).sab;
                          return Alert(
                            context: context,
                            title: 'Sabedoria',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'sab');
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
                              personagem.sab,
                              style: TextStyle(fontSize: 30.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: CircleBorder(),
                      child: Consumer<Info>(
                        builder: (context, personagem, child) {
                          return Text(
                            personagem.mod[4],
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          );
                        }
                      )
                    )
                  ),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('CAR', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 70,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).car;
                          return Alert(
                            context: context,
                            title: 'Carisma',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'car');
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
                              personagem.car,
                              style: TextStyle(fontSize: 30.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: CircleBorder(),
                      child: Consumer<Info>(
                        builder: (context, personagem, child) {
                          return Text(
                            personagem.mod[5],
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          );
                        }
                      )
                    )
                  ),
                ],
              ),
            ]
          ),
          SizedBox(height: 20),
          Text('Salvaguardas', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
          ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: DataTable(
                columnSpacing: 0,
                dataRowHeight: 35,
                headingRowHeight: 35,
                columns: [
                  DataColumn(label: Text('Proficiência', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Bônus', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Salvaguarda', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                ], 
                rows: [
                  DataRow(
                    cells: [
                      DataCell(IconButton(
                        iconSize: 20,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.salvaguardas[0] ? Icons.radio_button_checked : Icons.radio_button_unchecked);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(0, 'salva');
                        }
                      ),),
                      DataCell(Consumer<Info>(
                        builder: (context, personagem, child) {
                        return Text(personagem.valoressalva[0], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));})),
                      DataCell(Text('Força', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                    ]
                  ),
                  DataRow(
                    cells: [
                      DataCell(IconButton(
                        iconSize: 20,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.salvaguardas[1] ? Icons.radio_button_checked : Icons.radio_button_unchecked);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(1, 'salva');
                        }
                      ),),
                      DataCell(Consumer<Info>(
                        builder: (context, personagem, child) {
                        return Text(personagem.valoressalva[1], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));})),
                      DataCell(Text('Destreza', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                    ]
                  ),
                  DataRow(
                    cells: [
                      DataCell(IconButton(
                        iconSize: 20,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.salvaguardas[2] ? Icons.radio_button_checked : Icons.radio_button_unchecked);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(2, 'salva');
                        }
                      ),),
                      DataCell(Consumer<Info>(
                        builder: (context, personagem, child) {
                        return Text(personagem.valoressalva[2], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));})),
                      DataCell(Text('Constituição', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                    ]
                  ),
                  DataRow(
                    cells: [
                      DataCell(IconButton(
                        iconSize: 20,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.salvaguardas[3] ? Icons.radio_button_checked : Icons.radio_button_unchecked);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(3, 'salva');
                        }
                      ),),
                      DataCell(Consumer<Info>(
                        builder: (context, personagem, child) {
                        return Text(personagem.valoressalva[3], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));})),
                      DataCell(Text('Inteligência', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                    ]
                  ),
                  DataRow(
                    cells: [
                      DataCell(IconButton(
                        iconSize: 20,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.salvaguardas[4] ? Icons.radio_button_checked : Icons.radio_button_unchecked);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(4, 'salva');
                        }
                      ),),
                      DataCell(Consumer<Info>(
                        builder: (context, personagem, child) {
                        return Text(personagem.valoressalva[4], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));})),
                      DataCell(Text('Sabedoria', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                    ]
                  ),
                  DataRow(
                    cells: [
                      DataCell(IconButton(
                        iconSize: 20,
                        icon: Consumer<Info>(
                          builder: (context, personagem, child) {
                            return Icon(personagem.salvaguardas[5] ? Icons.radio_button_checked : Icons.radio_button_unchecked);
                          }
                        ),
                        onPressed: (){
                          Provider.of<Info>(context, listen: false).seticon(5, 'salva');
                        }
                      ),),
                      DataCell(Consumer<Info>(
                        builder: (context, personagem, child) {
                        return Text(personagem.valoressalva[5], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));})),
                      DataCell(Text('Carisma', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                    ]
                  )
                ]
              ),
            ),
          )  
        ],
      ),
    );
  }
}