import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';
import 'package:rpg_acda/pages/info.dart';

class Inventario extends StatelessWidget {

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
              Text('Ataques', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 180),
              IconButton(icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 35),
                onPressed: () {
                  Provider.of<Info>(context, listen: false).addataque();
                },
              )
            ],
          ),
          Container(
            color: Colors.black,
            height: 190,
            width: 310,
            child: Consumer<Info>(
              builder: (context, personagem, child) {
                return ListView.separated(
                  itemCount: personagem.ataquenome.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Colors.white),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red, child: Icon(Icons.cancel), alignment: Alignment.centerRight, padding: EdgeInsets.all(10)),
                      child: Container(
                        color: Colors.black,
                        child: ListTile(
                          leading: Container(
                            width: 70,
                            child: FlatButton(child: Text(personagem.ataquebonus[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                              onPressed: () {
                                myController.text = personagem.ataquebonus[index];
                                return Alert(
                                  context: context,
                                  title: 'Editar Bônus do Ataque',
                                  content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                                  buttons: [
                                    DialogButton(
                                      color: Colors.black,
                                      child: Text('OK', style: TextStyle(color: Colors.white),),
                                      onPressed: () {
                                        Provider.of<Info>(context, listen: false).updatecoisa(myController.text, index, 'bonus');
                                        Navigator.pop(context);
                                      }
                                    )
                                  ]
                                ).show();
                              },
                            ),
                          ),
                          title: Text(personagem.ataquenome[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                          subtitle: Text(personagem.dano[index],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15, color: Colors.white),),
                          trailing: IconButton(icon: Icon(Icons.edit), color: Colors.white,
                            onPressed: () {
                              myController.text = personagem.dano[index];
                              return Alert(
                                context: context,
                                title: 'Editar Dano',
                                content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                                buttons: [
                                  DialogButton(
                                    color: Colors.black,
                                    child: Text('OK', style: TextStyle(color: Colors.white),),
                                    onPressed: () {
                                      Provider.of<Info>(context, listen: false).updatecoisa(myController.text, index, 'dano');
                                      Navigator.pop(context);
                                    }
                                  )
                                ]
                              ).show();  
                            }
                          ),
                          dense: true,
                          onTap: () {
                            myController.text = personagem.ataquenome[index];
                            return Alert(
                              context: context,
                              title: 'Editar Nome do Ataque',
                              content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                              buttons: [
                                DialogButton(
                                  color: Colors.black,
                                  child: Text('OK', style: TextStyle(color: Colors.white),),
                                  onPressed: () {
                                    Provider.of<Info>(context, listen: false).updatecoisa(myController.text, index, 'nome');
                                    Navigator.pop(context);
                                  }
                                )
                              ]
                            ).show();
                          }
                        ),
                      ),
                      onDismissed: (direction) {
                        Provider.of<Info>(context, listen: false).tiraataque(index);
                      },
                      direction: DismissDirection.endToStart,
                    );
                  },
                );
              }
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Características e Talentos', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              IconButton(icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 35),
                onPressed: () {
                  myController.text = '';
                  return Alert(
                    context: context,
                    title: 'Nova Característica',
                    content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                    buttons: [
                      DialogButton(
                        color: Colors.black,
                        child: Text('OK', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          Provider.of<Info>(context, listen: false).addcoisa(myController.text, 'cara');
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
            height: 210,
            width: 230,
            child: Consumer<Info>(
              builder: (context, personagem, child) {
                return ListView.separated(
                  itemCount: personagem.caracteristicas.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Colors.black),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red, child: Icon(Icons.cancel), alignment: Alignment.centerRight, padding: EdgeInsets.all(10)),
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(personagem.caracteristicas[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          dense: true,
                          onTap: () {
                            myController.text = personagem.caracteristicas[index];
                            return Alert(
                              context: context,
                              title: 'Editar Característica',
                              content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                              buttons: [
                                DialogButton(
                                  color: Colors.black,
                                  child: Text('OK', style: TextStyle(color: Colors.white),),
                                  onPressed: () {
                                    Provider.of<Info>(context, listen: false).updatecoisa(myController.text, index, 'cara');
                                    Navigator.pop(context);
                                  }
                                )
                              ]
                            ).show();
                          }
                        ),
                      ),
                      onDismissed: (direction) {
                        Provider.of<Info>(context, listen: false).tiracoisa(personagem.caracteristicas[index], 'cara');
                      },
                      direction: DismissDirection.endToStart,
                    );
                  },
                );
              }
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Equipamento', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                      SizedBox(width: 50),
                      IconButton(icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 35),
                        onPressed: () {
                          myController.text = '';
                          return Alert(
                            context: context,
                            title: 'Novo Equipamento',
                            content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).addcoisa(myController.text, 'equi');
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
                    height: 390,
                    width: 190,
                    child: Consumer<Info>(
                      builder: (context, personagem, child) {
                        return ListView.separated(
                          itemCount: personagem.equipamento.length,
                          separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Colors.black),
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              key: UniqueKey(),
                              background: Container(color: Colors.red, child: Icon(Icons.cancel), alignment: Alignment.centerRight, padding: EdgeInsets.all(10)),
                              child: Container(
                                color: Colors.white,
                                child: ListTile(
                                  title: Text(personagem.equipamento[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                  dense: true,
                                  onTap: () {
                                    myController.text = personagem.equipamento[index];
                                    return Alert(
                                      context: context,
                                      title: 'Editar Equipamento',
                                      content: TextField(controller: myController, inputFormatters: [BlacklistingTextInputFormatter(RegExp('["]'))]),
                                      buttons: [
                                        DialogButton(
                                          color: Colors.black,
                                          child: Text('OK', style: TextStyle(color: Colors.white),),
                                          onPressed: () {
                                            Provider.of<Info>(context, listen: false).updatecoisa(myController.text, index, 'equi');
                                            Navigator.pop(context);
                                          }
                                        )
                                      ]
                                    ).show();
                                  }
                                ),
                              ),
                              onDismissed: (direction) {
                                Provider.of<Info>(context, listen: false).tiracoisa(personagem.equipamento[index], 'equi');
                              },
                              direction: DismissDirection.endToStart,
                            );
                          },
                        );
                      }
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Dinheiro', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 35),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).dinheiro[0];
                          return Alert(
                            context: context,
                            title: 'Peças de Cobre',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'pc');
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
                              personagem.dinheiro[0],
                              style: TextStyle(fontSize: 18.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  Text('Cobre', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).dinheiro[1];
                          return Alert(
                            context: context,
                            title: 'Peças de Prata',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'pp');
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
                              personagem.dinheiro[1],
                              style: TextStyle(fontSize: 18.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  Text('Prata', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).dinheiro[2];
                          return Alert(
                            context: context,
                            title: 'Peças de Elektro',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'pe');
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
                              personagem.dinheiro[2],
                              style: TextStyle(fontSize: 18.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  Text('Elektro', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).dinheiro[3];
                          return Alert(
                            context: context,
                            title: 'Peças de Ouro',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'po');
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
                              personagem.dinheiro[3],
                              style: TextStyle(fontSize: 18.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  Text('Ouro', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: FlatButton(
                        onPressed: () {
                          myController.text = Provider.of<Info>(context, listen: false).dinheiro[4];
                          return Alert(
                            context: context,
                            title: 'Peças de Platina',
                            content: TextField(controller: myController, keyboardType: TextInputType.number),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                child: Text('OK', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<Info>(context, listen: false).setinfo(myController.text, 'pl');
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
                              personagem.dinheiro[4],
                              style: TextStyle(fontSize: 18.0),
                            );
                          }
                        )
                      ),
                    ),
                  ),
                  Text('Platina', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}