import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeStateFulState();
}

class _HomeStateFulState extends State<Home> {

  Map<String, String> _frases = {
    "Morte é apenas o começo.": "images/mordekaiser.jpeg",
    "A evolução é inevitável.": "images/khazix.jpeg",
    "Policiais primeiro.": "images/caitlyn.jpeg",
    "A luz da alvorada sempre traz esperança.": "images/leona.jpeg",
    "A espada da consciência é afiada.": "images/yasuo.jpeg",
    "Fada sapeca.": "images/lulu.jpeg",
    "Mais, mais poder!": "images/veigar.jpeg",
    "Eu sou a sombra na lua, eu sou o pesadelo.": "images/hecarim.jpeg",
    "Pela honra, eu governarei Demacia!": "images/jarvan.jpeg",
    "Eu sou o rei do pântano!": "images/trundle.jpeg"
  };

  String _title = "Gerador de Frases";
  String _fraseGerada = "";
  String campeaoDaFala = "images/logo.png";

  void _gerarFrase() {
    String gerarIndex = _frases.keys.elementAt(Random().nextInt(_frases.length));

    setState(() {
      campeaoDaFala = _frases[gerarIndex] ?? "images/logo.png";
      _fraseGerada = gerarIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_title"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          /*decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.purpleAccent)
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("$campeaoDaFala"),
              Text("$_fraseGerada"),
              Text(
                "Clique abaixo para gerar uma frase!",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                ),
              ),
              ElevatedButton(onPressed: _gerarFrase,
                child:Text(
                  "Gerar Frase",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
