import 'package:app_live/perfil.dart';
import 'package:flutter/material.dart';

import 'camera.dart';
import 'inicio.dart';

class Home extends StatefulWidget {
  String nome;
  var cameras;
  Home({this.nome, this.cameras});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    
  List<Widget> telas = [
    Inicio("${widget.nome}"),
    Perfil(),
    Camera(widget.cameras)
  ];
    return Scaffold(
      appBar:AppBar(
        title: Text("App Live Home"),
        backgroundColor: Colors.greenAccent,
      ),
      body:Container(
        //padding: EdgeInsets.all(8),
        child: telas[_indice],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indice,

        onTap: (index){
          setState(() {
           _indice = index; 
          });
          print(_indice);
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("Perfil")),
          BottomNavigationBarItem(icon: Icon(Icons.camera), title: Text("Camera")),
        ]

        )
    );
  }
}