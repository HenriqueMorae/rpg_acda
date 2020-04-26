import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_acda/pages/info.dart';

class Pericias extends StatelessWidget {
  final List<String> pericias = ['Acrobacia','Arcanismo','Atletismo','Atuação','Enganação',
  'Furtividade','História','Intimidação','Intuição','Investigação','Lidar com Animais',
  'Medicina','Natureza','Percepção','Persuasão','Prestidigitação','Religião','Sobrevivência'];

  final List<String> atr = ['DES','INT','FOR','CAR','CAR','DES','INT','CAR','SAB',
  'INT','SAB','SAB','INT','SAB','CAR','DES','INT','SAB'];

  @override
  Widget build(BuildContext context) {
    return Consumer<Info>(
      builder: (context, personagem, child) {
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Colors.white),
          padding: EdgeInsets.all(20),
          itemCount: 18,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              child: ListTile(
                leading: Text(personagem.valorespericias[index],textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                title: Text(pericias[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                subtitle: Text(atr[index], style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13),),
                trailing: IconButton(icon: Icon(personagem.pericias[index] ? Icons.radio_button_checked : Icons.radio_button_unchecked),
                  onPressed: () {
                    Provider.of<Info>(context, listen: false).seticon(index, 'pro');
                  },),
                dense: true,
              ),
            );
          },
        );
      }
    );
  }
}