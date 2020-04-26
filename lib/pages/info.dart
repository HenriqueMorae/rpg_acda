import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class Info extends ChangeNotifier {
  List<String> listadepersonagens = [];

  // Dados do personagem
  String id = '-1';

  String nome = 'Nome';
  String classe = 'Classe';
  String raca = 'Raça';

  String nivel = '0';
  String bonus = '+0';
  List<bool> inspiracao = [false, false, false, false, false];

  String forc = '0';
  String des = '0';
  String con = '0';
  String inte = '0';
  String sab = '0';
  String car = '0';

  List<String> mod = ['+0','+0','+0','+0','+0','+0'];

  String classearmadura = '0';
  String deslocamento = '0';

  String pvatual = '0';
  String pvmaximo = '0';
  String pvtemporario = '0';

  String dadodevida = '0';
  String totaldadodevida = '0';
  List<bool> sucessos = [false, false, false];
  List<bool> falhas = [false, false, false];

  List<bool> salvaguardas = [false, false, false, false, false, false];
  List<String> valoressalva = ['+0','+0','+0','+0','+0','+0'];

  List<bool> pericias = [false, false, false, false, false, false,
  false, false, false, false, false, false, false, false, false, false, false, false];
  List<String> valorespericias = ['+0','+0','+0','+0','+0','+0',
  '+0','+0','+0','+0','+0','+0','+0','+0','+0','+0','+0','+0'];

  List<String> proficiencias = [];
  List<String> equipamento = [];
  List<String> caracteristicas = [];
  List<String> dinheiro = ['0','0','0','0','0'];

  List<String> ataquenome = [];
  List<String> ataquebonus = [];
  List<String> dano = [];

  List<String> magia = ['Classe', 'Atributo', '0', '+0'];
  List<String> espacos = ['0','0','0','0','0','0','0','0','0'];
  List<int> usados = [0,0,0,0,0,0,0,0,0];

  // Métodos do personagem
  void tiramagia (int qual) {
    usados[qual]--;
    notifyListeners();
  }

  void addmagia (int qual) {
    usados[qual]++;
    notifyListeners();
  }

  void addataque () {
    ataquenome.add('NOME');
    ataquebonus.add('+0');
    dano.add('DANO');
    notifyListeners();
  }

  void addcoisa (String coisita, String lista) {
    if (coisita != '') {
      switch (lista) {
        case 'pro': proficiencias.add(coisita); break;
        case 'equi': equipamento.add(coisita); break;
        case 'cara': caracteristicas.add(coisita); break;
        case 'lista': listadepersonagens.add(coisita); break;
      }
      notifyListeners();
    }
  }

  void updatecoisa (String coisita, int local, String lista) {
    if (coisita != '') {
      switch (lista) {
        case 'pro': proficiencias[local] = coisita; break;
        case 'equi': equipamento[local] = coisita; break;
        case 'cara': caracteristicas[local] = coisita; break;
        case 'nome': ataquenome[local] = coisita; break;
        case 'bonus': ataquebonus[local] = coisita; break;
        case 'dano': dano[local] = coisita; break;
        case 'magia': espacos[local] = coisita; break;
        case 'lista': listadepersonagens[local] = coisita; break;
      }
      notifyListeners();
    }
  }

  void tiracoisa (String coisita, String lista) {
    switch (lista) {
      case 'pro': proficiencias.remove(coisita); break;
      case 'equi': equipamento.remove(coisita); break;
      case 'cara': caracteristicas.remove(coisita); break;
      case 'lista': listadepersonagens.remove(coisita); break;
    }
    notifyListeners();
  }

  void tiraataque (int local) {
    ataquenome.removeAt(local);
    ataquebonus.removeAt(local);
    dano.removeAt(local);
    notifyListeners();
  }

  bool temp () {
    if (pvtemporario == '0')
      return false;
    else
      return true;
  }

  String passivo () {
    int percep;

    if (valorespericias[13][0] == '+') {
      percep = int.parse(valorespericias[13][1]);
    } else {
      percep = int.parse(valorespericias[13]);
    }

    int total = 10 + percep;
    return total.toString();
  }

  Color vida () {
    if(pvmaximo == '0') {
      return Colors.black;
    } else if(pvatual == '0') {
      return Colors.white;
    } else {
      int atual = int.parse(pvatual);
      int max = int.parse(pvmaximo);
      double porcento = atual/max;
      if (porcento == 1)
        return Colors.green;
      else if (porcento < 1 && porcento > 0.7)
        return Colors.lightGreen;
      else if (porcento <= 0.7 && porcento > 0.5)
        return Colors.yellow;
      else if (porcento <= 0.5 && porcento > 0.25)
        return Colors.orange;
      else if (porcento <= 0.25 && porcento > 0)
        return Colors.red;
      else return Colors.white;
    }
  }

  void setbonus () {
    if (nivel == '1' || nivel == '2' || nivel == '3' || nivel == '4'){
      bonus = '+2';
    } else if (nivel == '5' || nivel == '6' || nivel == '7' || nivel == '8'){
      bonus = '+3';
    } else if (nivel == '9' || nivel == '10' || nivel == '11' || nivel == '12'){
      bonus = '+4';
    } else if (nivel == '13' || nivel == '14' || nivel == '15' || nivel == '16'){
      bonus = '+5';
    } else if (nivel == '17' || nivel == '18' || nivel == '19' || nivel == '20'){
      bonus = '+6';
    } else {
      bonus = '+0';
    }
  }

  void seticon (int i, String qual) {
    switch (qual) {
      case 'ins': inspiracao[i] = !inspiracao[i]; break;
      case 'vida': sucessos[i] = !sucessos[i]; break;
      case 'morte': falhas[i] = !falhas[i]; break;
      case 'salva': salvaguardas[i] = !salvaguardas[i]; setsalva(i); break;
      case 'pro': pericias[i] = !pericias[i]; setpro(i); break; 
    }
    notifyListeners();
  }

  void setpro (int i) {
    String modescolhido;
    int mods;
    int profi;
    int total;
    
    if (pericias[i]) {
      profi = int.parse(bonus[1]);
    } else {
      profi = 0;
    }

    if (i == 2) modescolhido = mod[0]; // for
    if (i == 0 || i == 5 || i == 15) modescolhido = mod[1]; // des
    if (i == 1 || i == 6 || i == 9 || i == 12 || i == 16) modescolhido = mod[3]; // int
    if (i == 8 || i == 10 || i == 11 || i == 13 || i == 17) modescolhido = mod[4]; // sab
    if (i == 3 || i == 4 || i == 7 || i == 14) modescolhido = mod[5]; // car

    if (modescolhido[0] == '+') {
      mods = int.parse(modescolhido[1]);
    } else {
      mods = int.parse(modescolhido);
    }

    total = mods + profi;

    if (total >= 0) {
      valorespericias[i] = '+' + total.toString();
    } else {
      valorespericias[i] = total.toString();
    }
  }

  void setsalva (int i) {
    int mods;
    int profi;
    int total;
    
    if (salvaguardas[i]) {
      profi = int.parse(bonus[1]);
    } else {
      profi = 0;
    }

    if (mod[i][0] == '+') {
      mods = int.parse(mod[i][1]);
    } else {
      mods = int.parse(mod[i]);
    }

    total = mods + profi;

    if (total >= 0) {
      valoressalva[i] = '+' + total.toString();
    } else {
      valoressalva[i] = total.toString();
    }
  }

  void settudo () {
    for (int i=0; i<6; i++)
      setsalva(i);
    
    for (int i=0; i<18; i++)
      setpro(i);
  }

  void setinfo (String coisa, String atributo) {
    switch (atributo) {
      case 'classemagia': magia[0] = coisa; break;
      case 'atrmagia': magia[1] = coisa; break;
      case 'cdmagia': magia[2] = coisa; break;
      case 'modmagia': magia[3] = coisa; break;
      case 'pc': dinheiro[0] = coisa; break;
      case 'pp': dinheiro[1] = coisa; break;
      case 'pe': dinheiro[2] = coisa; break;
      case 'po': dinheiro[3] = coisa; break;
      case 'pl': dinheiro[4] = coisa; break;
      case 'nome': nome = coisa; break;
      case 'classe': classe = coisa; break;
      case 'raca': raca = coisa; break;
      case 'ca': classearmadura = coisa; break;
      case 'deslocamento': deslocamento = coisa; break;
      case 'pvat': pvatual = coisa; break;
      case 'pvmax': pvmaximo = coisa; break;
      case 'pvtem': pvtemporario = coisa; break;
      case 'ddv': dadodevida = coisa; break;
      case 'tddv': totaldadodevida = coisa; break;
      case 'nivel':
        nivel = coisa;
        setbonus();
        settudo();
        break;
      case 'for':
        forc = coisa;
        mod[0] = calmod(forc);
        setsalva(0);
        setpro(2);
        break;
      case 'des':
        des = coisa;
        mod[1] = calmod(des);
        setsalva(1);
        setpro(0); setpro(5); setpro(15);
        break;
      case 'con':
        con = coisa;
        mod[2] = calmod(con);
        setsalva(2);
        break;
      case 'int':
        inte = coisa;
        mod[3] = calmod(inte);
        setsalva(3);
        setpro(1); setpro(6); setpro(9); setpro(12); setpro(16);
        break;
      case 'sab':
        sab = coisa;
        mod[4] = calmod(sab);
        setsalva(4);
        setpro(8); setpro(10); setpro(11); setpro(13); setpro(17);
        break;
      case 'car':
        car = coisa;
        mod[5] = calmod(car);
        setsalva(5);
        setpro(3); setpro(4); setpro(7); setpro(14);
        break;
    }
    notifyListeners();
  }

  String calmod(String valor){
    switch (valor) {
      case '1': return '-5';
      case '2': return '-4';
      case '3': return '-4';
      case '4': return '-3';
      case '5': return '-3';
      case '6': return '-2';
      case '7': return '-2';
      case '8': return '-1';
      case '9': return '-1';
      case '10': return '+0';
      case '11': return '+0';
      case '12': return '+1';
      case '13': return '+1';
      case '14': return '+2';
      case '15': return '+2';
      case '16': return '+3';
      case '17': return '+3';
      case '18': return '+4';
      case '19': return '+4';
      case '20': return '+5';
      default: return '+0';
    }
  }

  // Métodos para salvar e abrir o personagem
  void setid (String i, bool novo) {
    id = i;
    //print('id=$id');
    abrir(novo);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationSupportDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/personagem$id.txt');
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;
      String conteudo = await file.readAsString();
      return conteudo;
    } catch (e) {
      return 'ERRO';
    }
  }

  Future<File> writeData(String data) async {
    final file = await _localFile;
    return file.writeAsString(data);
  }

  void abrir (bool novo) {
    if (novo) {
      nome = 'Nome';
      classe = 'Classe';
      raca = 'Raça';
      nivel = '0';
      bonus = '+0';
      inspiracao = [false, false, false, false, false];
      forc = '0';
      des = '0';
      con = '0';
      inte = '0';
      sab = '0';
      car = '0';
      mod = ['+0','+0','+0','+0','+0','+0'];
      classearmadura = '0';
      deslocamento = '0';
      pvatual = '0';
      pvmaximo = '0';
      pvtemporario = '0';
      dadodevida = '0';
      totaldadodevida = '0';
      sucessos = [false, false, false];
      falhas = [false, false, false];
      salvaguardas = [false, false, false, false, false, false];
      valoressalva = ['+0','+0','+0','+0','+0','+0'];
      pericias = [false, false, false, false, false, false,
      false, false, false, false, false, false, false, false, false, false, false, false];
      valorespericias = ['+0','+0','+0','+0','+0','+0',
      '+0','+0','+0','+0','+0','+0','+0','+0','+0','+0','+0','+0'];
      proficiencias = [];
      equipamento = [];
      caracteristicas = [];
      dinheiro = ['0','0','0','0','0'];
      ataquenome = [];
      ataquebonus = [];
      dano = [];
      magia = ['Classe', 'Atributo', '0', '+0'];
      espacos = ['0','0','0','0','0','0','0','0','0'];
      usados = [0,0,0,0,0,0,0,0,0];
      //print('NOVO');
      salvar();
    } else {
      readData().then((String dados) {
        if (dados != 'ERRO' && dados != '') {
          Map<String, dynamic> user = jsonDecode(dados);

          nome = user['nome'];
          classe = user['classe'];
          raca = user['raca'];
          nivel = user['nivel'];
          bonus = user['bonus'];
          inspiracao = mudalistabool(user['inspiracao']);
          forc = user['for'];
          des = user['des'];
          con = user['con'];
          inte = user['int'];
          sab = user['sab'];
          car = user['car'];
          mod = mudalista(user['mod']);
          classearmadura = user['ca'];
          deslocamento = user['deslocamento'];
          pvatual = user['pvat'];
          pvmaximo = user['pvmax'];
          pvtemporario = user['pvtem'];
          dadodevida = user['ddv'];
          totaldadodevida = user['tddv'];
          sucessos = mudalistabool(user['sucessos']);
          falhas = mudalistabool(user['falhas']);
          salvaguardas = mudalistabool(user['salva']);
          valoressalva = mudalista(user['vsalva']);
          pericias = mudalistabool(user['pericias']);
          valorespericias = mudalista(user['vpericias']);
          proficiencias = mudalista(user['pro']);
          equipamento = mudalista(user['equi']);
          caracteristicas = mudalista(user['carac']);
          dinheiro = mudalista(user['dinheiro']);
          ataquenome = mudalista(user['nomea']);
          ataquebonus = mudalista(user['bonusa']);
          dano = mudalista(user['dano']);
          magia = mudalista(user['magia']);
          espacos = mudalista(user['espacos']);
          usados = mudalistaint(user['usados']);
          
          notifyListeners();
          //print('CARREGADO');
        }
      });
    }
  }

  List<bool> mudalistabool (List<dynamic> troco) {
    List<bool> finalista = [];
    String qual;
    for (int i=0; i<troco.length; i++) {
      qual = troco[i].toString();
      if (qual == 'false') {
        finalista.add(false);
      } else {
        finalista.add(true);
      }
    }
    return finalista;
  }

  List<int> mudalistaint (List<dynamic> troco) {
    List<int> finalista = [];
    for (int i=0; i<troco.length; i++) {
      finalista.add(int.parse(troco[i].toString()));
    }
    return finalista;
  }

  List<String> mudalista (List<dynamic> troco) {
    List<String> finalista = [];
    for (int i=0; i<troco.length; i++) {
      finalista.add(troco[i].toString());
    }
    return finalista;
  }

  void salvar () {
    String modm = mod.join('","');
    String valoressalvam = valoressalva.join('","');
    String valorespericiasm = valorespericias.join('","');
    String dinheirom = dinheiro.join('","');
    String magiam = magia.join('","');
    String espacosm = espacos.join('","');
    
    String proficienciasmq = proficiencias.join('","');
    String equipamentomq = equipamento.join('","');
    String caracteristicasmq = caracteristicas.join('","');
    String ataquenomemq = ataquenome.join('","');
    String ataquebonusmq = ataquebonus.join('","');
    String danomq = dano.join('","');

    String proficienciasm;
    String equipamentom;
    String caracteristicasm;
    String ataquenomem;
    String ataquebonusm;
    String danom;

    if (proficiencias.length > 0) {
      proficienciasm = '"' + proficienciasmq + '"';
    } else {
      proficienciasm = proficienciasmq;
    }
    
    if (equipamento.length > 0) {
      equipamentom = '"' + equipamentomq + '"';
    } else {
      equipamentom = equipamentomq;
    }

    if (caracteristicas.length > 0) {
      caracteristicasm = '"' + caracteristicasmq + '"';
    } else {
      caracteristicasm = caracteristicasmq;
    }
    
    if (ataquenome.length > 0) {
      ataquenomem = '"' + ataquenomemq + '"';
    } else {
      ataquenomem = ataquenomemq;
    }

    if (ataquebonus.length > 0) {
      ataquebonusm = '"' + ataquebonusmq + '"';
    } else {
      ataquebonusm = ataquebonusmq;
    }
    
    if (dano.length > 0) {
      danom = '"' + danomq + '"';
    } else {
      danom = danomq;
    }

    String dados = """{
  "nome": "$nome",
  "classe": "$classe",
  "raca": "$raca",
  "nivel": "$nivel",
  "bonus": "$bonus",
  "inspiracao": $inspiracao,
  "for": "$forc",
  "des": "$des",
  "con": "$con",
  "int": "$inte",
  "sab": "$sab",
  "car": "$car",
  "mod": ["$modm"],
  "ca": "$classearmadura",
  "deslocamento": "$deslocamento",
  "pvat": "$pvatual",
  "pvmax": "$pvmaximo",
  "pvtem": "$pvtemporario",
  "ddv": "$dadodevida",
  "tddv": "$totaldadodevida",
  "sucessos": $sucessos,
  "falhas": $falhas,
  "salva": $salvaguardas,
  "vsalva": ["$valoressalvam"],
  "pericias": $pericias,
  "vpericias": ["$valorespericiasm"],
  "pro": [$proficienciasm],
  "equi": [$equipamentom],
  "carac": [$caracteristicasm],
  "dinheiro": ["$dinheirom"],
  "nomea": [$ataquenomem],
  "bonusa": [$ataquebonusm],
  "dano": [$danom],
  "magia": ["$magiam"],
  "espacos": ["$espacosm"],
  "usados": $usados
}""";

    writeData(dados);
    //print('PERSONAGEM SALVO');
  }

  // Métodos para cuidar da lista dos personagens do App
  Future<File> get _localLista async {
    final path = await _localPath;
    return File('$path/lista.txt');
  }

  Future<String> readLista() async {
    try {
      final file = await _localLista;
      String conteudo = await file.readAsString();
      return conteudo;
    } catch (e) {
      return 'ERRO';
    }
  }

  Future<File> writeLista(String data) async {
    final file = await _localLista;
    return file.writeAsString(data);
  }

  void abrirlista () {
    readLista().then((String lista){
      if (lista != 'ERRO' && lista != '') {
        Map<String, dynamic> user = jsonDecode(lista);

        listadepersonagens = mudalista(user['lista']);
        notifyListeners();
        //print('LISTA ABERTA');
      }
    });
  }

  void salvarlista () {
    String listadepersonagensmq = listadepersonagens.join('","');
    String listadepersonagensm;

    if (listadepersonagens.length > 0) {
      listadepersonagensm = '"' + listadepersonagensmq + '"';
    } else {
      listadepersonagensm = listadepersonagensmq;
    }

    String dados = """{
  "lista": [$listadepersonagensm]
}""";

    writeLista(dados);
    //print('LISTA SALVA');
  }

  Future<File> deletelista (String dado) async {
    final path = await _localPath;
    return File('$path/personagem$dado.txt').delete();
  }
}