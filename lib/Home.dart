import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _titulo = "imagens/youtube.png";
  var _indiceAtual = 0;
  String? _pesquisa = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_pesquisa.toString()),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          _titulo,
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("Ação: VideoCam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              //print("Ação: Pesquisa");
              String? res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _pesquisa = res;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("Ação: Conta");
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        //type: BottomNavigationBarType.shifting, //Alto(4) Cores no Iten
        type: BottomNavigationBarType.fixed, //Alto(<4) Cores no Bar
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: "Inicio",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: "Em Alta",
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
              icon: Icon(Icons.folder)
          )
        ]
      ),
    );
  }
}
